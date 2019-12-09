Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC95117BE8
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2019 00:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfLIX4M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Dec 2019 18:56:12 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34372 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbfLIX4M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Dec 2019 18:56:12 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so12187558lfc.1
        for <linux-next@vger.kernel.org>; Mon, 09 Dec 2019 15:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLqN4/IUc9R1B2G8hkahDuDsKQb+tqVkqB0eS8GumWY=;
        b=fsQIqClh8cCQwVMNi64O+uLYyJYb9A7DfVz26EeOCRhVUT0WiKRxceewQtOXxZ3v6c
         ODOYHxGBGTXd18P8p/Sv6AQzFHGYbF6ATH0rduJGhrTB1euZILfbusANQJGQMW1oqImh
         DYH8aCUnIFql12mLdSKoiqaadwpJKYTt7x3ozEfBih1h+QPv4BNK65HLpLAN3sYIC43H
         lfoRrV4w8hgCBHsRNYNGp2g6CS5KviHOFxQhD1EMZVJl7ljxC4VTfGxfpdXCUmM2E/pe
         3SwdU4zOGCKO/pTcThlLtqKRTB8AKQayTzGKzeCp8ZVNFYNJOLr09jKH/Km1Ay6Nlb1t
         psog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLqN4/IUc9R1B2G8hkahDuDsKQb+tqVkqB0eS8GumWY=;
        b=FMU/bZJ05VoACrKo7zBj3M6wPR/Z4hmyB7tdGofZ+tK3MJ/Wj5xTGNQhedGW2Tj0ka
         EdftGdMhXwuwWYsSeAgzpT0l+0GDVUSYLmn1HfzR+qvy2yOdnUtMp+R4bbqu4rkhm5lQ
         AK4SErAoZpEgW1RBAJQY+Lx0PlatMrJHvo9/8I0Fc906TM6vsA9Abe0iTitk1IO4ndV8
         S6P0URweTzJNFz0h9HRbyXgKzlyhkP7mR8Zr3wiZ931e6yGsOP9kEb3hfNj0fxyKeXpE
         ho9bNf1SAVqAO3rfzB5m5bHHf267lZ8/rYwroOYdogI4cHrmc380m5xAl04lgmmifnrm
         oQDg==
X-Gm-Message-State: APjAAAW8cnHQm1Nx03/148Aj/9Ikfx4KfyLeTP0o7LiRjYWj+ulHLwou
        cbOMq91KV5+jy9XsY2/FLk0cOgML1XuN88csM0dS
X-Google-Smtp-Source: APXvYqyW3brFpY8T+Vh5W3sZI4v9w5DtieT95776Q0vWz2BO0M2OwI0v8jhAWm9vMQd7hLQKjZv3OjZB914IaZuX/vo=
X-Received: by 2002:ac2:54b5:: with SMTP id w21mr16602770lfk.175.1575935770341;
 Mon, 09 Dec 2019 15:56:10 -0800 (PST)
MIME-Version: 1.0
References: <20191210105037.085b3418@canb.auug.org.au>
In-Reply-To: <20191210105037.085b3418@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 9 Dec 2019 18:55:59 -0500
Message-ID: <CAHC9VhRnyCuV-w-irXdC_WL_aF92Brs1UhN9iuTaqCKHamA+gg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with the keys tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jamorris@linux.microsoft.com>,
        Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 9, 2019 at 6:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the selinux tree got a conflict in:
>
>   include/linux/lsm_audit.h
>
> between commit:
>
>   59336b0f8000 ("smack: Implement the watch_key and post_notification hooks")
>
> from the keys tree and commit:
>
>   59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
>
> from the selinux tree.
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
> diff --cc include/linux/lsm_audit.h
> index 734d67889826,99d629fd9944..000000000000
> --- a/include/linux/lsm_audit.h
> +++ b/include/linux/lsm_audit.h
> @@@ -74,7 -74,7 +74,8 @@@ struct common_audit_data
>   #define LSM_AUDIT_DATA_FILE   12
>   #define LSM_AUDIT_DATA_IBPKEY 13
>   #define LSM_AUDIT_DATA_IBENDPORT 14
>  -#define LSM_AUDIT_DATA_LOCKDOWN 15
>  +#define LSM_AUDIT_DATA_NOTIFICATION 15
> ++#define LSM_AUDIT_DATA_LOCKDOWN 16
>         union   {
>                 struct path path;
>                 struct dentry *dentry;

That should be fine, thanks.

-- 
paul moore
www.paul-moore.com
