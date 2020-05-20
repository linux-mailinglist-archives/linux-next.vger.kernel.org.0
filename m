Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA58A1DB047
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 12:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgETKeT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 06:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgETKeS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 06:34:18 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A02EC05BD43
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 03:34:18 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t8so2719159wmi.0
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wHwuK554VhbEDUoapI14azPz8Hgjvi50lBlxsWiVKX8=;
        b=dZNC1J5ypymn1jU6Byg8EPaBtx0iN/1DIHceCLtkm5ZN62pZaAM6qLFo69H93K051w
         nEFHjWsNPV4ljKXRdpDRbIC2GxHPUuneGdFOqCabJABeFbEy0qZNxTyUZWuFZXtPhR99
         wwdZQtudQd/cHlInsliGMRW2QUx7CzktPvTf+BuhU4jurkcIzEs5qbRiHA8AWZAEjp6C
         tUBhEENQN3hN8Ob/5r+eI+wuJ+/MghjTgXBB8HkB7aqzL8wuv8QiRuRJ3494heAyIw0a
         WPD4KXjtaKv/JogXTODnC/Ip+MHz5vriC1ArcAq5dOXkzYPPdHABKpYeRBZMRq57iYHR
         lgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wHwuK554VhbEDUoapI14azPz8Hgjvi50lBlxsWiVKX8=;
        b=k0NWA3XSEXWQ/rhzL62XRizpMG0hnc0+8yeeg8ULytT1DHt1b0/prXoOrJlyNvv91M
         rATXO4KCNjfE6yjgMUpbikcQdIcUWrNByTaKOdVUtGpkBw7bHky8Q8xSdXzhDKdZ3S6+
         TADjO3JaYjs9FmlQOyf0AaI7T8igKQBfMh9NHk5/musJExu8wyYJJ5bhhrds9clNQB1r
         REJQhFt5JOfUTG50JhQ6ymFj1+luc8d0rk/Wd2S586lvfAv2U81dHWylV6PXhlb/r953
         b4gZhu9oRJ2DWnvQWrs8bvn73ya9DFvSq5h3lOTEoQJDyLVnJRwDkQbd+LQXFNU+FDEZ
         bcjA==
X-Gm-Message-State: AOAM532Cp7n302LiGhTjKC4r2WIwB+pQEjwbA4ATyBtXwl8RuxNbKX3v
        zP9thzbRMGGANCX+GpvhouhX7A==
X-Google-Smtp-Source: ABdhPJxo5njsQyNYOEuPCeVVUlNTJmBhexBhhghXeVryIeeckAHJiBoMUenYHQrPUA509KHduFahjg==
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr3869535wmc.97.1589970856782;
        Wed, 20 May 2020 03:34:16 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f8sm2314536wrm.8.2020.05.20.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 03:34:16 -0700 (PDT)
Date:   Wed, 20 May 2020 11:34:14 +0100
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
Message-ID: <20200520103414.bejflo3s4exrcyzk@holly.lan>
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

Applied, thanks!


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
