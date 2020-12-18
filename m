Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278142DDE62
	for <lists+linux-next@lfdr.de>; Fri, 18 Dec 2020 07:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730833AbgLRGFL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Dec 2020 01:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgLRGFK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2020 01:05:10 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD3CC0617A7;
        Thu, 17 Dec 2020 22:04:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 23so2457418lfg.10;
        Thu, 17 Dec 2020 22:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XRqPmQD3TzPPUKo5nQdR6sJALqfnUOhMjLgcKy+rsBY=;
        b=lmBdVFzPLi4TZUNiJyUJFDl1Rv4QKckjC3DV2nXeBiYA3tPrNbtJzOQ8WAJp7B15Xo
         9m7F7LceC5st3Wcz9IScozKbYJ6Gce0gvppclSrdq4hJNTCSncq2KueRMZkAN1Y4saJN
         NgVRaYoHaV//DWENvJKP8MNPjbtzYAxONM8MHt72NlPktJUOyh/OjgHwHQcJh69R2x7q
         AQFTT4MqesLuSbv8o5eQGfOCv3LKjEw04UsaiFJzZKV4a3OByqO8PnRB2U/iYiQlbgPD
         rCjHlSNv22bRQikoQNJANDx79o+KR7RH9Rs6jferG6kXPiEC6qlVcmboEAA5EFUKfK95
         TwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XRqPmQD3TzPPUKo5nQdR6sJALqfnUOhMjLgcKy+rsBY=;
        b=hlwk+0xe5GxpkEzyi36hdMkKamVswcTFFkr0F/72LDLNVKQkF64G89G9gTv833uTgl
         ivtKhTAberCeq+7d4xT30TFoFCI38SiNUl6Ag89WRy/QW3vIbMxGkpkg3ENW5lhNcLF8
         8ZENvrlJOmPAZHC9liryUhvk5DeyrXNPMilNGsHMUc4a9O5OonTa9SZ27kIwSG0M9pTP
         ELt099DEW/kUlCDO31dsWpfEPnsbP9b33/FweaLF2ewnFNeqKzp9KbU//rBHPEre39C0
         9sjI9Juybvwvk6PpnvwrMViyNvohgC2p5IBpGF8vJe8VkEyib9YAwci83QvCoXDmucU+
         bX3g==
X-Gm-Message-State: AOAM532z/C4ahFEG1gh+jQkbIXYCBE+lJohgLpiPHijAF2qO6ePj2yI6
        ENQ+wg7xkzahxu/U7JuzLYPXhN7rPKkPc7F9HrRlCgZYVp8=
X-Google-Smtp-Source: ABdhPJzVHraVZE0q5zTUVSQQyqG/JzRrzB9neauc16U32F09tC+KasPEcyxBdMa5UlaaKUr2kJL2QEMtyj9iPXHXp9U=
X-Received: by 2002:a2e:9250:: with SMTP id v16mr1161484ljg.256.1608271468787;
 Thu, 17 Dec 2020 22:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20201218165737.0759162a@canb.auug.org.au>
In-Reply-To: <20201218165737.0759162a@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Fri, 18 Dec 2020 00:04:17 -0600
Message-ID: <CAH2r5mtbRwrExGOJBqDxnEQ=6WDtN_z3_dqes3HFWozCnOst3w@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I have now amended the patches to have the correct author and repushed

On Thu, Dec 17, 2020 at 11:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   ee04fe87f4d0 ("cifs: Re-indent cifs_swn_reconnect()")
>   2c6dd2f9742d ("cifs: Unlock on errors in cifs_swn_reconnect()")
>   fb2356b3739b ("cifs: Delete a stray unlock in cifs_swn_reconnect()")
>
> are missing a Signed-off-by from their author.
>
> This is the problem with the mailing list again :-(  The
> author has been recorded as
>
> "Dan Carpenter via samba-technical <samba-technical@lists.samba.org>"
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
