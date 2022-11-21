Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C492632C59
	for <lists+linux-next@lfdr.de>; Mon, 21 Nov 2022 19:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiKUSv5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Nov 2022 13:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiKUSv4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Nov 2022 13:51:56 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5667BD06ED
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2022 10:51:55 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id q96-20020a17090a1b6900b00218b8f9035cso2950839pjq.5
        for <linux-next@vger.kernel.org>; Mon, 21 Nov 2022 10:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zm84tpupvmaITkohpBn02m0iZCyzot9WfjUTwDdO95Q=;
        b=TZHHW5kNwjAzkad1Zh5h9lS46JKIGDzI0CDjZhUR4ipjaOHvuj/kxUflclqyIIty9J
         ISzkI2wwBxbUewoU2rAUzbPYHweiawqutaVuI89coe9QRvGziEcY9yAz0uyDJS6tu4hN
         b4hGWZNap3cziCocVkF/WGi3J8dIgnGZLVBiWuCO8BBOznpJwuwC5q6PHGLEFy8AcYdA
         GAFbPatrorCAiEHJtag0mktSYQ873Uelh1yES5QgjKxwpaWh9jByWPpDcy5FtyClXw8v
         Gp3s1oLamUmLbyinhmRdL8vYHC8FSoUXQ2i5jf1Cx9QKoWOmCog2eHLbqtdQF3H5eYYg
         f6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zm84tpupvmaITkohpBn02m0iZCyzot9WfjUTwDdO95Q=;
        b=Mxcc9lB7r6GtPY1kqjEFaL7lqCYTChjsh6Vkipv3MGhukd41dTx6MFOFXjwsgyC9Pa
         i8xh6MopacuhNhJsBhyR1+tan/G/FUWQWvlfvicpcGO796R6fdyf8zeObSluiAefLvNx
         wsh2qhuWmphPiyvAjVylLnY4v0iwsobUi4tuPr4cPI2GU26M20ISSkgv+U9Kq4WOmFla
         SJGj1drpRDapIThh3+ZTuruuAoZp2RrzO9sk4dWhzeZqhjd4qg2+wvvxSchGh996A0Z1
         VRBQ2itCV5c56lHobRlS1lFAsAT3Y1PHDtt5piiLtMDIB+vnVC69kv4eqd4W3UqsW85Q
         qIoA==
X-Gm-Message-State: ANoB5plKlsKevMepKHbJb35odB+Ajk18zCiUv6fBEz0JCE7NQjtcWjGv
        4t5Qgl6O9ae2UucED7ynq/5IpLVhKjtcT5cuKlRv
X-Google-Smtp-Source: AA0mqf4rpW3YO/j4tiyJM0wxI7W4oxRgQk46kvGUSnjsiDptiajWC26FP9j9VcWhsE0W9OXx4MOSRPXOCHhgb8w1HUU=
X-Received: by 2002:a17:90b:2743:b0:20d:4173:faf9 with SMTP id
 qi3-20020a17090b274300b0020d4173faf9mr27566513pjb.147.1669056714787; Mon, 21
 Nov 2022 10:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20221121142658.2e3f4108@canb.auug.org.au>
In-Reply-To: <20221121142658.2e3f4108@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 21 Nov 2022 13:51:43 -0500
Message-ID: <CAHC9VhR0csviPvHfh5CYm76PVz8LaAaAt38oRv+3gbFHEJP0yw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the apparmor tree with the security tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     John Johansen <john.johansen@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Nov 20, 2022 at 10:27 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the apparmor tree got a conflict in:
>
>   security/apparmor/domain.c
>
> between commit:
>
>   f6fbd8cbf3ed ("lsm,fs: fix vfs_getxattr_alloc() return type and caller error paths")
>
> from the security tree and commit:
>
>   217af7e2f4de ("apparmor: refactor profile rules and attachments")
>
> from the apparmor tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc security/apparmor/domain.c
> index 00dc0ec066de,b447bc13ea8e..000000000000
> --- a/security/apparmor/domain.c
> +++ b/security/apparmor/domain.c
> @@@ -308,14 -296,16 +296,15 @@@ static int change_profile_perms(struct
>    * Returns: number of extended attributes that matched, or < 0 on error
>    */
>   static int aa_xattrs_match(const struct linux_binprm *bprm,
> -                          struct aa_profile *profile, unsigned int state)
> +                          struct aa_profile *profile, aa_state_t state)
>   {
>         int i;
>  -      ssize_t size;
>         struct dentry *d;
>         char *value = NULL;
> -       int size, value_size = 0, ret = profile->xattr_count;
> +       struct aa_attachment *attach = &profile->attach;
>  -      int value_size = 0, ret = attach->xattr_count;
> ++      int size, value_size = 0, ret = attach->xattr_count;
>
> -       if (!bprm || !profile->xattr_count)
> +       if (!bprm || !attach->xattr_count)
>                 return 0;
>         might_sleep();

John's the AppArmor expert, but this looks okay to me.  As a reminder,
the lsm/next commit only changes the type of @size from a ssize_t to
an int type.

-- 
paul-moore.com
