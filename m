Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6CD18EC2F
	for <lists+linux-next@lfdr.de>; Sun, 22 Mar 2020 21:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgCVUie (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Mar 2020 16:38:34 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:47837 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbgCVUie (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Mar 2020 16:38:34 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3f94461
        for <linux-next@vger.kernel.org>;
        Sun, 22 Mar 2020 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=7+gsGOeaFkVMJQYGutUp4XP3StE=; b=kY2US1
        ZMLQ223n+v2sRkvUU7MNO7Zy6a0PFv3S/qJ+VugYOtE1l2Sq4y8PkGdwCnJI7dDj
        YML1u8sdE1KS1OXQj/do1gwi9GAE/FlaHhOUjDqn+0X6hot9nTqWIP3uopDrzEAY
        EQZ5cOojQiMU5oXdRyqRsFXHZniThaxcow9z6EJSkXdjGq4ThDXJPu5Gozk2opTS
        fktKPpEmrBuV/ZUagTykmKKIOcA2ArgeHv7pdKc4ZzGTr5CBIZLjs4Nuyz53Ebw5
        tBUt9mJoeRdwIKV3evN0Cm14xISjyP57NytPs2hssD9Euw48fAG0AoETWrQKwOJ8
        qTNZBraPcijUVlUA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7e3e28e5 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
        for <linux-next@vger.kernel.org>;
        Sun, 22 Mar 2020 20:31:38 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id m15so6954601iob.5
        for <linux-next@vger.kernel.org>; Sun, 22 Mar 2020 13:38:32 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0XKX82GENL/i5G+YdOjDU0IUbAcKTj1+jbqPrpcP/MHOb4HbBs
        POM1/pT+jORua/xZpPEr709mzBGlniI1A1vgNq8=
X-Google-Smtp-Source: ADFU+vvQxclao/GELRfOHjUY6I8s/kVH1s+RMjXWpi7XL0fZPQjMx7y8qCkPePRQaPWVmfTMhlMlKaQxh+YgEc2KQW4=
X-Received: by 2002:a5d:9805:: with SMTP id a5mr16100483iol.80.1584909512222;
 Sun, 22 Mar 2020 13:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190916084901.GA20338@gondor.apana.org.au> <20190923050515.GA6980@gondor.apana.org.au>
 <20191202062017.ge4rz72ki3vczhgb@gondor.apana.org.au> <20191214084749.jt5ekav5o5pd2dcp@gondor.apana.org.au>
 <20200115150812.mo2eycc53lbsgvue@gondor.apana.org.au> <20200213033231.xjwt6uf54nu26qm5@gondor.apana.org.au>
 <20200224060042.GA26184@gondor.apana.org.au> <20200312115714.GA21470@gondor.apana.org.au>
 <CAHk-=wjbTF2iw3EbKgfiRRq_keb4fHwLO8xJyRXbfK3Q7cscuQ@mail.gmail.com>
 <CAHmME9pME41uHvhu5f_JGZbUNCuG0YVgRkBUQF9wtTO6YnMijw@mail.gmail.com> <CAHk-=wjGaHhVKyxBYCcw41j84ic1GbyAuGfN7nA9zCJyHZTw2Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjGaHhVKyxBYCcw41j84ic1GbyAuGfN7nA9zCJyHZTw2Q@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Sun, 22 Mar 2020 14:38:21 -0600
X-Gmail-Original-Message-ID: <CAHmME9omjc7N2jakS8-+XA8=wJo4XijO6ujYjn_XvE5Tm+2PVg@mail.gmail.com>
Message-ID: <CAHmME9omjc7N2jakS8-+XA8=wJo4XijO6ujYjn_XvE5Tm+2PVg@mail.gmail.com>
Subject: Re: [GIT PULL] Crypto Fixes for 5.6
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Per our IRC discussion, here's an email for your records:

On Sat, Mar 21, 2020 at 9:43 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Anyway, your conversion patches look fine to me. I'm obviously not
> taking them for 5.6, but if they go into -next and get some testing,
> I'd love to have that cleanup in 5.7.

Would you put the "for-next" branch of
https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/linux.git into
linux-next?

Thanks,
Jason
