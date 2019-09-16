Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04B06B3F17
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 18:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390026AbfIPQh3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 12:37:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40729 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfIPQh3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 12:37:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so53415wmj.5;
        Mon, 16 Sep 2019 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5GSLRtaWXP5trJhqVOplw/3NUbMs67XKaj1GvOZOB7Y=;
        b=Wjcwn0bYH1NkN6RT5L8bAJuVTizoUSFL2YFRKqCKCmSD5HiQoZTg+VC9QMz2gRCp7+
         1UNydDzMTvaoUs8OU7IMPPcuchD1IhtJhnCY2eDt+96Bum4e5Rd1IRBbQsTNE1tvMV1q
         FTUlb9lbj4JWDlKAc5vf/SEpJCPsweWcQpCmShH1Kb+xkCp3KKcZhgw89WAyYfq7/CQx
         W6xgPUrGbY0r0D7hhskHA8GqNv/EtHcugI6HfQ7tEAUmwxQjuRgvZxz5DUGZkg8VxhJM
         ER61Iu6ZYtIS4i2kp+H4EtbvoggSB9SIGJurXd85S9eaDLT/2fSzHqZlgbYk39jZbbJP
         fzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5GSLRtaWXP5trJhqVOplw/3NUbMs67XKaj1GvOZOB7Y=;
        b=jH/HSQkdgSMapanfiNtYu98W5OLgNUIaHmtg304wpmlYY5m8cv0OVq06MdYi54C6DD
         fY5qZSq/7dS+NvBEYjyBpuEKhFkpSQ3QiTUwHebrfCXhrBhhrLotiN77zrAvPdfkM5XC
         iPLiCyK93Zii7Xl9kITugXIKFg3iXOhxQJp5h1SrlHpZ7DS8AKNVMfgoVv7ZrZ+hJZHz
         FFG4EfuBQAYibLU7SBMS7JRiLKNUrYbMf1Sg2Jy4OAM/oCxe1aLh2xNm4pCZ37J8sNcF
         +n9fqk/S5284vngAran+DUJ1l/qYAWGva/opofdvAHK4/FgsKJrfmzlZ/2Ta7ZZ/CT0L
         ZIlA==
X-Gm-Message-State: APjAAAWqPr9IK6SnGvRx4kVbZA0MTy2sSaXC0nfGOuzK/SsoDoLfEfuV
        t6/yiCUKUH/AHisJ1pq3e5PpIgHUUpEkBwr5F6I=
X-Google-Smtp-Source: APXvYqzA+3qCVXj4SPQHZUzSNPHIKuJNpnJe+OL9j20Ou/1YJskceQAFv7l87MBB9gRCRvkGgnlPsye9L1/vGj+W0cc=
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr73764wmb.104.1568651846964;
 Mon, 16 Sep 2019 09:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190916134029.GF4352@sirena.co.uk>
In-Reply-To: <20190916134029.GF4352@sirena.co.uk>
From:   Richard Weinberger <richard.weinberger@gmail.com>
Date:   Mon, 16 Sep 2019 18:37:15 +0200
Message-ID: <CAFLxGvwZPBg7834aq4rqJyxMNCkNThPa2hGuwuuzpxYkHiQN7Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the ubifs tree
To:     Mark Brown <broonie@kernel.org>
Cc:     David Howells <dhowells@redhat.com>,
        Richard Weinberger <richard@nod.at>,
        Artem Bityutskiy <dedekind1@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Wenwen Wang <wenwen@cs.uga.edu>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 16, 2019 at 3:40 PM Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the vfs tree got a conflict in:
>
>   fs/ubifs/super.c
>
> between commit:
>
>   9163e0184bd7d5f ("ubifs: Fix memory leak bug in alloc_ubifs_info() error path")
>
> from the ubifs tree and commit:
>
>   50d7aad57710e2b ("vfs: Convert ubifs to use the new mount API")
>
> from the vfs tree.
>
> I fixed it up dropping the ubifs change and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks a lot for letting me know!

-- 
Thanks,
//richard
