Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A171DA0CA
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 21:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgESTOv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 15:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgESTOv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 15:14:51 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5003C08C5C2
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 12:14:50 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id i15so605651wrx.10
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 12:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wEq9P5HnCfUm9vk24Pjpsrg932s/fp+shOA9bBHZRYI=;
        b=U1v22pjdFEgh26Q4N8u+nq5aSkSji6AanM9ZXmU8FbY4MF7bqry7qJkOOpyirOvWAf
         T76R5DNl7HninB1H8gou4BB4vUBhGEHAGqrc9OL9Uxks65TuU54aRzTe3ytKGOTYYlGN
         YQE8z18HTvOBDcHd0uDpHEn92X6ru2QZ7rzpGMTWCSFGkzCl36SK/HWZmTDSniGdytln
         RzGeu8z3GlkkGyH+cypz1adDeSJf8AypJD6L+o/pgFDEQIKyDJAJk8kqxVB1ieD5v7cj
         G7O+SBYIbU6cee0ZUV9VZR+sOr5RfteCzNmOlDOaxyyxJU2BJAlyyFn73ZoodsFsce6z
         h9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wEq9P5HnCfUm9vk24Pjpsrg932s/fp+shOA9bBHZRYI=;
        b=tXS67190WN8INr9sC6Y2q212y/lCC7rH5JOu17nlpsZvvwPwzWe5QoIuRrmJ9vjEWf
         9WJiuS987iNOyc77BtPMRd2Ktru7jajdsQF8zzFJ68UcFBK3HCGQHZySH9UOfks9BEER
         xQjbEBRLmG0hbbNSIVPmwgKW2BRNvGXabrL4Sf7Ng18DHodGGi9PGcPzdAr+X/UjIJs7
         3bxy+coUQZLySPSvAejJ27mFHGcfvxHl1sjvFmN+hw/YA7MnZkk3anm+Bzg69meORENw
         LU30JAzU+4CCkQoYwG7zRIWV5yk6UvbHlm3dpGdFTEW/ruqhqo6X0BOK5Ly4Uc3sUDMG
         yzFw==
X-Gm-Message-State: AOAM532s2tdU/xY+zOIDASPiXcN3GnEQgczP1hYTwdKuoR3+wOHkVUUC
        YukxkTxyORCEgBBwf2T1Lor0XQ==
X-Google-Smtp-Source: ABdhPJyQADGkHTqT9aWT/EdvTBmXbqG4ivJlWWFIusns8fU2Ap7T2kPHiX/RkUx6bu28om/YBrHVWg==
X-Received: by 2002:a05:6000:11ca:: with SMTP id i10mr453589wrx.10.1589915689318;
        Tue, 19 May 2020 12:14:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id v2sm464710wrn.21.2020.05.19.12.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 12:14:48 -0700 (PDT)
Date:   Tue, 19 May 2020 20:14:46 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jason Wessel <jason.wessel@windriver.com>,
        linux-next@vger.kernel.org, sumit.garg@linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH] kgdboc: Disable all the early code when kgdboc is a
 module
Message-ID: <20200519191446.ybe2phdzac6vxyzx@holly.lan>
References: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519084345.1.I91670accc8a5ddabab227eb63bb4ad3e2e9d2b58@changeid>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 19, 2020 at 08:44:02AM -0700, Douglas Anderson wrote:
> When kgdboc is compiled as a module all of the "ekgdboc" and
> "kgdb_earlycon" code isn't useful and, in fact, breaks compilation.
> This is because early_param() isn't defined for modules and that's how
> this code gets configured.
> 
> It turns out that this was broken by commit eae3e19ca930 ("kgdboc:
> Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc") and then
> made worse by commit 220995622da5 ("kgdboc: Add kgdboc_earlycon to
> support early kgdb using boot consoles").  I guess the #ifdef wasn't
> so useless, even if it wasn't obvious why it was useful.  When kgdboc
> was compiled as a module only "CONFIG_KGDB_SERIAL_CONSOLE_MODULE" was
> defined, not "CONFIG_KGDB_SERIAL_CONSOLE".  That meant that the old
> module.
> 
> Let's basically do the same thing that the old code (pre-removal of
> the #ifdef) did but use "IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)" to
> make it more obvious what the point of the check is.  We'll fix
> kgdboc_earlycon in a similar way.
> 
> Fixes: 220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles")
> Fixes: eae3e19ca930 ("kgdboc: Remove useless #ifdef CONFIG_KGDB_SERIAL_CONSOLE in kgdboc")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks Doug. I've got this running though my build checks now (which
I have just noted an improvement for ;-) ) and will get it into
kgdb/for-next as soon as possible.


Daniel.


> ---
> 
>  drivers/tty/serial/kgdboc.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
> index 34b5e91dd245..fa6f7a3e73b9 100644
> --- a/drivers/tty/serial/kgdboc.c
> +++ b/drivers/tty/serial/kgdboc.c
> @@ -43,9 +43,11 @@ static int			kgdb_tty_line;
>  
>  static struct platform_device *kgdboc_pdev;
>  
> +#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static struct kgdb_io		kgdboc_earlycon_io_ops;
>  static struct console		*earlycon;
>  static int                      (*earlycon_orig_exit)(struct console *con);
> +#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
>  
>  #ifdef CONFIG_KDB_KEYBOARD
>  static int kgdboc_reset_connect(struct input_handler *handler,
> @@ -140,10 +142,19 @@ static void kgdboc_unregister_kbd(void)
>  #define kgdboc_restore_input()
>  #endif /* ! CONFIG_KDB_KEYBOARD */
>  
> -static void cleanup_kgdboc(void)
> +#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
> +static void cleanup_earlycon(void)
>  {
>  	if (earlycon)
>  		kgdb_unregister_io_module(&kgdboc_earlycon_io_ops);
> +}
> +#else /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
> +static inline void cleanup_earlycon(void) { }
> +#endif /* !IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
> +
> +static void cleanup_kgdboc(void)
> +{
> +	cleanup_earlycon();
>  
>  	if (configured != 1)
>  		return;
> @@ -388,6 +399,7 @@ static struct kgdb_io kgdboc_io_ops = {
>  	.post_exception		= kgdboc_post_exp_handler,
>  };
>  
> +#if IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE)
>  static int kgdboc_option_setup(char *opt)
>  {
>  	if (!opt) {
> @@ -544,6 +556,7 @@ static int __init kgdboc_earlycon_init(char *opt)
>  }
>  
>  early_param("kgdboc_earlycon", kgdboc_earlycon_init);
> +#endif /* IS_BUILTIN(CONFIG_KGDB_SERIAL_CONSOLE) */
>  
>  module_init(init_kgdboc);
>  module_exit(exit_kgdboc);
> -- 
> 2.26.2.761.g0e0b3e54be-goog
> 
