Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B1711906C
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 20:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfLJTQI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 14:16:08 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38236 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbfLJTQI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 14:16:08 -0500
Received: by mail-lf1-f68.google.com with SMTP id r14so14653617lfm.5
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x7Ly+kFcY9v41W0Yea6eldt67FJ9rQnUT+trJTG6+Xc=;
        b=LyKla2v+ft5Potq4hfBOyqRFw/cMaj4PcpgLni4B1h2XGMuwdiIcgEBJVer+fW8JTw
         HlS9Jacjm4c9JF4zRDK4+Smjj6jl6XYyoADKrz7o6sFvE4rfNfxlYDIzouy+sBgM9O9k
         AomjW/lGgjAyjzhIDXIFQe1+e8daEft3o9x3NSsj9c5Y3toSpTnLsYtRVTNEYI/7ExD/
         j5sO1wp9msJ8fqjpbV+cWh2d5KIVmeGa/3ctA/4PuRHCDhch29FSvQXAaf2CCgYso7Gg
         gFXKFXV1PnFLBLyKRg8Kruz6KTfNrQU6L8Vgwa0B9b4GQ/eUddi35/fqgcc2frFAp9q+
         rhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7Ly+kFcY9v41W0Yea6eldt67FJ9rQnUT+trJTG6+Xc=;
        b=IqC6oH1Rsjye63vDL1JXswjnkr+mq4nl+TgSEcmSHpivYikrb4srXwwctDxKNMTWxP
         AmmMWuNOVtOYotg1v6Mh+xPa32G9/Y1Cd01Vl1dE+FqQJZEZQv4JtyvIqyi3T/qdPQf4
         xJ7cfR2vM1SNHf1Nr0nn4ggenIE/2w6oaCmkahqmAfRYnVszEO0Yhy6MQh2AEfNVF2/d
         UsP/lb4pNU/pVtHeuktjvVIN9ULAkLa9x3QYpNxB15ZEFnPFDz46MGmKCVlAqKSP3uhG
         mZxm6tbxyOyQIk+YVHYBgRySR1jhCNjsIltJv3yfH3rNQagKaQ1KptyWgCNlr7wM0wFP
         wtmw==
X-Gm-Message-State: APjAAAXaPR+4/YAY0XwZ+i4/3x8d4NcQ1MK+jjmN/z5PuQ4bAe/RlWJZ
        HxK+Wheq53zIOusi59va2nyZPrNq5KwkTtyOrX5aLVZBPA==
X-Google-Smtp-Source: APXvYqzeIvo9MtJbPbux8OasVwNKp66VtrSv68Mg4neHZLu1UIs3yW5CziyvWWX7G8TYK5FShvquGUXIbancx+AALC4=
X-Received: by 2002:a19:f514:: with SMTP id j20mr18471703lfb.31.1576005365522;
 Tue, 10 Dec 2019 11:16:05 -0800 (PST)
MIME-Version: 1.0
References: <20191210165541.85245-1-sds@tycho.nsa.gov>
In-Reply-To: <20191210165541.85245-1-sds@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 10 Dec 2019 14:15:54 -0500
Message-ID: <CAHC9VhRnqfuVUTDZA+8G-_OTqqN8M7XJhOpiO1m3t0XhY584Xw@mail.gmail.com>
Subject: Re: [PATCH] security: only build lsm_audit if CONFIG_SECURITY=y
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-next@vger.kernel.org, jamorris@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 10, 2019 at 11:55 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> The lsm_audit code is only required when CONFIG_SECURITY is enabled.
> It does not have a build dependency on CONFIG_AUDIT since audit.h
> provides trivial static inlines for audit_log*() when CONFIG_AUDIT
> is disabled.  Hence, the Makefile should only add lsm_audit to the
> obj lists based on CONFIG_SECURITY, not CONFIG_AUDIT.
>
> Fixes: 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
> Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> ---
>  security/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into selinux/next in order to fix the linux-next build
breakage.  James, if you would prefer a different fix, let us know.

> diff --git a/security/Makefile b/security/Makefile
> index be1dd9d2cb2f..746438499029 100644
> --- a/security/Makefile
> +++ b/security/Makefile
> @@ -22,7 +22,7 @@ obj-$(CONFIG_SECURITY)                        += security.o
>  obj-$(CONFIG_SECURITYFS)               += inode.o
>  obj-$(CONFIG_SECURITY_SELINUX)         += selinux/
>  obj-$(CONFIG_SECURITY_SMACK)           += smack/
> -obj-$(CONFIG_AUDIT)                    += lsm_audit.o
> +obj-$(CONFIG_SECURITY)                 += lsm_audit.o
>  obj-$(CONFIG_SECURITY_TOMOYO)          += tomoyo/
>  obj-$(CONFIG_SECURITY_APPARMOR)                += apparmor/
>  obj-$(CONFIG_SECURITY_YAMA)            += yama/
> --
> 2.23.0

-- 
paul moore
www.paul-moore.com
