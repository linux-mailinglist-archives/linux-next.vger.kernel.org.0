Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC9D117DA9
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 03:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfLJCZ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 21:25:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36560 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbfLJCZx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Dec 2019 21:25:53 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so18042695ljg.3
        for <linux-next@vger.kernel.org>; Mon, 09 Dec 2019 18:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hGHO2M5txop41S0pm7dDz8V62aTHzW6Nn2xeNv86ayQ=;
        b=rUHufGCp6EIf5KY8l3khfho84MdZP2MW0bW/pAL4vexbHeUugMe4fewy1MBR8OLfZB
         9kEZg/8gBhBaPuYlaIRyIV2tEeBcZbUJKBpcnK9GnbrmVPHV5dO9CoaFP1b5FOYvCm6F
         HnLqHZxL/iepXS5n2ZwrBZIGAQaIYurJ81aF3d/Tz6yq2JtV3W7RPnf2sLp57DJ66l9q
         TRKr2b51NokEpFLSzN+433yT08nm3NfFsAOlLF7QxM1oRaz4nVM0tarfE2FKoptyHKgb
         4jBQChzEQvvvuKCcUAlu7FzFZXURFn8FV2NJBujpKNbqTtgk2SekOZMALKbYLp2EnXIL
         wadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hGHO2M5txop41S0pm7dDz8V62aTHzW6Nn2xeNv86ayQ=;
        b=T+1yPiJaWd8rt0Xgr/jEu4diwu31PrCH6Y0d78wwJkqDSxpof5EKBsOWPpTW29s0EB
         rtC3nmgvEAr6EjRU4xWAL7X/6uEm6XOs5c8yDovIIGW8cUM4cKWTCIUlUleJoDIWdHu/
         ZzUy4RQ3HTsKH5WfHpUZkoOEQm4Hnc7iykvIXGCT5R8+UzGszBnKWZmlaRR9vjmvUfiq
         B3AWDlvFxxm78wbv6WyplBEuquXwG6hpt39MPExWGynLIup9YwmfDPMA0DK1de2oEAsQ
         ksCG5Y/ujQQO8z8LqtCbZYUpPkBL2giBd/LIhz+0H2QUAqUZ1cBTFIe5qKSlu4pj6Ga+
         AC/g==
X-Gm-Message-State: APjAAAWiCjWsd4kBw3xFNydUnK3Sfut5EA6sB8Va8z23p/19LAixmT+N
        y7fXKoOvj5iNkCowo2EGS/olDRq2aWICvEW/0vtF
X-Google-Smtp-Source: APXvYqwaDMumZX1i/jL/oy22xRgwcKrHm1W5A0eXWF9G0Y2YJ22oQrnCcbln71FUczdl/ECUsqJi5ZNyZeKGBdsGNUI=
X-Received: by 2002:a2e:89da:: with SMTP id c26mr19242792ljk.54.1575944751067;
 Mon, 09 Dec 2019 18:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20191210124047.40852ade@canb.auug.org.au>
In-Reply-To: <20191210124047.40852ade@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 9 Dec 2019 21:25:40 -0500
Message-ID: <CAHC9VhQaBpUeAsH8Gy0NHFvE+mrkNO6_sHv2qTriiYCbfbU89A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the selinux tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jamorris@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 9, 2019 at 8:40 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the selinux tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
>
> ld: security/lsm_audit.o:(.toc+0x0): undefined reference to `lockdown_reasons'
>
> Caused by commit
>
>   59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
>
> CONFIG_SECURITY is not set for this build, but CONFIG_AUDIT is set.
>
> I applied the following hack for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 10 Dec 2019 12:28:16 +1100
> Subject: [PATCH] security,lockdown,selinux: hack for !CONFIG_SECURITY
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  security/lsm_audit.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
> index 2d2bf49016f4..f97a3337f307 100644
> --- a/security/lsm_audit.c
> +++ b/security/lsm_audit.c
> @@ -427,8 +427,10 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>                                  a->u.ibendport->port);
>                 break;
>         case LSM_AUDIT_DATA_LOCKDOWN:
> +#ifdef CONFIG_SECURITY
>                 audit_log_format(ab, " lockdown_reason=");
>                 audit_log_string(ab, lockdown_reasons[a->u.reason]);
> +#endif
>                 break;
>         } /* switch (a->type) */
>  }

Thanks for letting me know.  I'm sorry about that Stephen, I'll send
out a little more generic patch in just a minute as a RFC.

-- 
paul moore
www.paul-moore.com
