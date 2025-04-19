module PageFactory
    def on(page_class, visit = false, &block)
      @current_page = get_page_class(page_class, visit)
      $last_page_class = @current_page.class if visit
      yield @current_page if block
      @current_page
    end
  
    def visit(page_class, timeout = 30, &block)
      on(page_class, true)
      wait_until_page_loaded(page_class, timeout, &block)
    end
  
    def wait_until_page_loaded(page_class, timeout = 30, &block)
      @current_page = get_page_class(page_class, false)
      Watir::Wait.until(timeout: timeout, message: "#{page_class} didn't load") { @current_page.loaded? }
      Watir::Wait.until(timeout: timeout, message: "#{page_class} not ready") { @browser.execute_script('return document.readyState') == 'complete' }
      $last_page_class = @current_page.class
      yield @current_page if block
      @current_page
    end
  
    private
  
    def get_page_class(page_class, visit)
      klass = page_class.is_a?(String) ? Object.const_get(page_class) : page_class
      klass.new(@browser, visit)
    end
  end
  
World PageFactory