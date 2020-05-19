Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666BB1D9BA2
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 17:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbgESPsr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 11:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbgESPsq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 11:48:46 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBE6C08C5C0
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 08:48:46 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y198so89908pfb.4
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=npj6nyuWQ54ZRzukHs7PaMjCvPNDE9Mt94DLOgYmdAM=;
        b=P0+mae6a84cR5xUqIaEO+Q0bl2fCnvLeySFo+ugO3JyjssDIgkmsmpUbWGMOo30eLp
         4la4jakE5roQ8jjlKA1FzIi2twmGQr7jNmyR4G/fELC21PiyyV8enb6i9lBDEIrIB2rV
         AVTHOA5HszSMzkwJ81gPBz5iiLnARXbKwKDDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=npj6nyuWQ54ZRzukHs7PaMjCvPNDE9Mt94DLOgYmdAM=;
        b=p5dvEHyEsXLO3z9GRb2be5MgQNtwZLicEOi5dtPAutRxk5jmG6Byd3AKFDdZ83feCh
         jyZ4ped3YyRPr4rgF9KIWf23kJHug/U+YOkgK4Z00RoqV4mLjjbwvwr8adloXaIxet6a
         gq9oQcz01MehD3XLUC9T14XZYRRVvFteFB/Ad6y064q+NyTE98Wxhj2TIOdpym/KeIK0
         x0EUH0yVUbTYfacAWeFzqUt4VunCaLzJz8KafkrhcQ/7BM8K6KNYjxey59BUvwsv/N5p
         hF53VgDLQwqzag0QgJFGyfIPLxBYPCXyq6peHLfg0SU1C07sJdozLAqNKZod67BvOg13
         vfrw==
X-Gm-Message-State: AOAM532YB1ir8ltQZFMeGNqVlhg/Y7MRk0kJrZUFRtWOl+kdZT/ZaMvK
        sshjnqT1G/rGs/qtImnGpf89Jg==
X-Google-Smtp-Source: ABdhPJz5avKKNTtvKZvm8lzBMm3rjxfvXiD2QxxVE3dZa7xUCBH4RpcsiIOy1AoeYJ/nBEZkwHHoAw==
X-Received: by 2002:aa7:9aa8:: with SMTP id x8mr11608662pfi.182.1589903326036;
        Tue, 19 May 2020 08:48:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id c2sm9506pjg.51.2020.05.19.08.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 08:48:45 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jason Wessel <jason.wessel@windriver.com>
Cc:     linux-next@vger.kernel.org, sumit.garg@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH] kgdboc: Disable all the early code when kgdboc is a module
Date:   Tue, 19 May 2020 08:44:02 -0700
Message-Id: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

When kgdboc is compiled as a module all of the "ekgdboc" and
"kgdb_earlycon" code isn't useful and, in fact, breaks compilation.
This is because early_param() isn't defined for modules and that's how
this code gets configured.

It turns out that this was broken by commit eae3e19ca930 ("kgdboc:
Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc") and then
made worse by commit 220995622da5 ("kgdboc: Add kgdboc_earlycon to
support early kgdb using boot consoles").  I guess the #ifdef wasn't
so useless, even if it wasn't obvious why it was useful.  When kgdboc
was compiled as a module only "CONFIG_KGDB_SERIAL_CONSOLE_MODULE" was
defined, not "CONFIG_KGDB_SERIAL_CONSOLE".  That meant that the old
module.

Let's basically do the same thing that the old code (pre-removal of
the #ifdef) did but use "IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)" to
make it more obvious what the point of the check is.  We'll fix
kgdboc_earlycon in a similar way.

Fixes: 220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles")
Fixes: eae3e19ca930 ("kgdboc: Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/kgdboc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 34b5e91dd245..fa6f7a3e73b9 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -43,9 +43,11 @@ static int			kgdb_tty_line;
 
 static struct platform_device *kgdboc_pdev;
 
+#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
 static struct kgdb_io		kgdboc_earlycon_io_ops;
 static struct console		*earlycon;
 static int                      (*earlycon_orig_exit)(struct console *con);
+#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
 
 #ifdef CONFIG_KDB_KEYBOARD
 static int kgdboc_reset_connect(struct input_handler *handler,
@@ -140,10 +142,19 @@ static void kgdboc_unregister_kbd(void)
 #define kgdboc_restore_input()
 #endif /* ! CONFIG_KDB_KEYBOARD */
 
-static void cleanup_kgdboc(void)
+#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
+static void cleanup_earlycon(void)
 {
 	if (earlycon)
 		kgdb_unregister_io_module(&kgdboc_earlycon_io_ops);
+}
+#else /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
+static inline void cleanup_earlycon(void) { }
+#endif /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
+
+static void cleanup_kgdboc(void)
+{
+	cleanup_earlycon();
 
 	if (configured != 1)
 		return;
@@ -388,6 +399,7 @@ static struct kgdb_io kgdboc_io_ops = {
 	.post_exception		= kgdboc_post_exp_handler,
 };
 
+#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
 static int kgdboc_option_setup(char *opt)
 {
 	if (!opt) {
@@ -544,6 +556,7 @@ static int __init kgdboc_earlycon_init(char *opt)
 }
 
 early_param("kgdboc_earlycon", kgdboc_earlycon_init);
+#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
 
 module_init(init_kgdboc);
 module_exit(exit_kgdboc);
-- 
2.26.2.761.g0e0b3e54be-goog

