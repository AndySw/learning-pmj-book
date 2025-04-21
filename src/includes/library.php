<?php declare(strict_types=1);
  
    class Greeter {
        
        private $name, $password;
        private static $instance_count = 0;

        function __construct($name, $password) {
            $this->name = $name;
            $this->password = $password;
            self::$instance_count++;
        }

        function __destruct() {

        }

        static function get_count() {
            return self::$instance_count;
        }

        public function get_name() {
            return $this->name;
        }

        public function get_password() {
            return $this->password;
        }

        function my_function($lines) {
            for($i=0;$i<$lines;$i++) {
                echo "Hello $name<br>";
            }
        }

    }

?>