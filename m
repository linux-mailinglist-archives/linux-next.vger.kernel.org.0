Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1CD88A4B3
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 19:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfHLReU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 13:34:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37459 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfHLReU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Aug 2019 13:34:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id 129so3119802pfa.4
        for <linux-next@vger.kernel.org>; Mon, 12 Aug 2019 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aYWUhLUhFWFaj2IBlyeqpyuiKYe3byR6cuy6O3+sAu0=;
        b=fD5g47S8va3cncoYwUYSfFVsmYgZaWoR2hcX0eKKr+lM5nS0EMz/ThVSf72l3/xsfD
         h4IlLKwvYcz9v/Oaar90eFTbIZObIY1NtQQTMtlIOPsoS+d/Hr8jTEWOrWaBCOZy1F7X
         W4A6Isn4U+hPtfj0YcYUWhMCB7VYTpU36Nevk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aYWUhLUhFWFaj2IBlyeqpyuiKYe3byR6cuy6O3+sAu0=;
        b=VUxz+IUEh1LlDxkBV0FccpfRCnNFXWdzWtA8q5fpigIK422R3hBbavnwBDDBJ/eQcS
         c/nKVh1F5STwilvkUQT5UWEKvOcsVbLmN1z1jFX96BWPr4bYcyqgmul5LKIajor3nSfH
         K+2mQ795IHQfFJEF340RqxpgC4uxtPAsp/T4dzy9uoluslIsiFhcaxzxYhVSo7w257tF
         LgL36pSRrLsmtKq271xw+xeNaQUdwG2gZl8cb4h5Ym9+uuhB0DbZctEa1ZTPcz8ET7WY
         wxgmocDcGrjr8UuCZ6QsFrU/z5Vp0aLht7BsuYcva4ao/VNWF5U4kL7Ffw9LxK4C2rgs
         eZ+Q==
X-Gm-Message-State: APjAAAUuxn3dT4HEhXiJrltYHou5voFqXSCvrikmUggkMhT3IQRK/jDP
        EO8il4HGd26OZwkqbWZHi+zozw==
X-Google-Smtp-Source: APXvYqy7nuO9ZhZSKKRKRLzTnBsZpSlU4CtfOGJO2cEtb5hebTjlSiZu4egZRrDRFERHPfcTBeSvxw==
X-Received: by 2002:a63:3c5:: with SMTP id 188mr30385877pgd.394.1565631259650;
        Mon, 12 Aug 2019 10:34:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g11sm117389053pgu.11.2019.08.12.10.34.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 10:34:19 -0700 (PDT)
Date:   Mon, 12 Aug 2019 10:34:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     James Morris <jmorris@namei.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Garrett <mjg59@google.com>,
        Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: linux-next: build failure after merge of the security tree
Message-ID: <201908121033.BFBE9516AC@keescook>
References: <20190812145823.63d77573@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812145823.63d77573@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 12, 2019 at 02:58:23PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the security tree, today's linux-next build (arm
> multi_v7_defconfig) failed like below.
> 
> Caused by commit
> 
>   45d29f9e9b8b ("security: Support early LSMs")
> 
> I have added the following fix for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 12 Aug 2019 14:54:20 +1000
> Subject: [PATCH] early_security_init() needs a stub got !CONFIG_SECURITY
> 
> An arm multi_v7_defconfig fails like this:
> 
> init/main.c: In function 'start_kernel':
> init/main.c:596:2: error: implicit declaration of function 'early_security_init'; did you mean 'security_init'? [-Werror=implicit-function-declaration]
>   early_security_init();
>   ^~~~~~~~~~~~~~~~~~~
>   security_init
> 
> Fixes: 45d29f9e9b8b ("security: Support early LSMs")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  include/linux/security.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/security.h b/include/linux/security.h
> index 807dc0d24982..23e1c3f17d48 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -473,6 +473,11 @@ static inline int security_init(void)
>  	return 0;
>  }
>  
> +static inline int early_security_init(void)
> +{
> +	return 0;
> +}
> +
>  static inline int security_binder_set_context_mgr(struct task_struct *mgr)
>  {
>  	return 0;
> -- 
> 2.20.1
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Kees Cook
