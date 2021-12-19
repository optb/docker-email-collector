require ["fileinto","mailbox"];

if header :contains "X-Spam" "yes" {
  fileinto :create "Junk";
  stop;
}