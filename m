Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E02F3D7DB4
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 20:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhG0ScV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 14:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhG0ScU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Jul 2021 14:32:20 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8226C061757
        for <linux-next@vger.kernel.org>; Tue, 27 Jul 2021 11:32:20 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id x15-20020a05683000cfb02904d1f8b9db81so14373212oto.12
        for <linux-next@vger.kernel.org>; Tue, 27 Jul 2021 11:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9usW2whPM7vWiQ8y/768GmyCCil+l0cCB0HDM9IUzvg=;
        b=hUOGcPmoOvVP5OLebd0hc58q4NpEL78AlmfJ80j+VUuRQX5qM2JMzI//A8jxglNsin
         4YgL2myW85jXexLJrwC/nU9eFYXYySpSgPmyDdHb9LUkzjodyUfs5AZ61v5hMtG7o+x5
         cdHQmUbOJLv/RxHjAQUpTMbIMeTXD053Cft7QfdaEhQbUn+C/QwO1Tk45Q0fRya1GcuT
         EZmnRSh/fuzqTfWqeCjQNN9jV2ueXmOZ6ZMvSpanFcfUdDT6C8zvVwds3eBt5AFhJbiE
         mkQpm8KPJqWN1ObrOF2q2nxGZab+G7g71LBX2erJP6j8SR/HytjNIneyaZyOTveekJfI
         LkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9usW2whPM7vWiQ8y/768GmyCCil+l0cCB0HDM9IUzvg=;
        b=C9np7wN56zyjaWzUSXekuTUj4EeQVgSGxC2ODvAnO8IBagyKuf56TO3jyH22qUd1aU
         LZjpoUpzU9TOakAultrmoLtc8Rrd6qHXSzO7C9N0oaauCfZxvZWbLzXoHJls9ejrLWJm
         NaFlUGZRl0mHRiaUq/XlCHc2cJ7u5RebzQVeZ46fECrL72gulVAijQUSGn/614YKah9f
         RDrXRn/NIK/ZxTozYPaYOyoPiqv0rgEsTweyOuROzTphlwGFuF2DRD5HPY+PCUOxVTYj
         gtQpQnTQW+rNHJorwQRxGTyz1Gk20KUaZJNxNb0buMlbAm/rlrdNG0ZecQdDp60GNBqU
         7oNw==
X-Gm-Message-State: AOAM533lbP1Mtqqh65WTGIbQe8q6j+VK2/xQuK1YqUSVQ3N9qV2ave1W
        y/UQFL3BzMxdVavZ1ckvBssN4WTuSZr92T3RArWBNQ==
X-Google-Smtp-Source: ABdhPJxo6jYd7R6QdCI2ILuIv5rV6gqa3C/FXcQnzQguUuGy6BEofdroxxTil+Ks+cpoydHL+HqQR6sbQUOfaDp1+fk=
X-Received: by 2002:a9d:32f:: with SMTP id 44mr16444313otv.266.1627410739980;
 Tue, 27 Jul 2021 11:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <202107271057.xwwoSXFy-lkp@intel.com> <YP+umZ1/XX969ioH@infradead.org>
 <20210727085551.GA29619@quack2.suse.cz> <20210727085742.GA21354@lst.de> <20210727090727.GB29619@quack2.suse.cz>
In-Reply-To: <20210727090727.GB29619@quack2.suse.cz>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 28 Jul 2021 00:02:07 +0530
Message-ID: <CA+G9fYtsbvLykeT0C1xi6CXcGWrBD+qZuKvvBop+qdOuUpP0+A@mail.gmail.com>
Subject: Re: [ext3:generic_block_fiemap_removal 3/4] file.c:undefined
 reference to `iomap_fiemap'
To:     Jan Kara <jack@suse.cz>
Cc:     Christoph Hellwig <hch@lst.de>,
        Christoph Hellwig <hch@infradead.org>,
        kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 27 Jul 2021 at 14:37, Jan Kara <jack@suse.cz> wrote:
>
> On Tue 27-07-21 10:57:42, Christoph Hellwig wrote:
> > On Tue, Jul 27, 2021 at 10:55:51AM +0200, Jan Kara wrote:
> > > On Tue 27-07-21 07:58:33, Christoph Hellwig wrote:
> > > > Oops, hpfs now needs to select FS_IOMAP:
> > >
> > > And I assume ext2 as well, right? So far ext2 needed iomap only for DAX
> > > which selects FS_IOMAP itself. But now ext2 needs iomap also without DAX...
> >
> > Indeed.
>
> I've ammended the two commits and pushed the result out.

Thank you !

FYI,
The reported build failures noticed today's linux next 20210727 tag on
 - arc (defconfig) with gcc-9
 - sparc (defconfig) with gcc-10

arc-elf32-ld: fs/ext2/inode.o: in function `ext2_fiemap':
inode.c:(.text+0x1c24): undefined reference to `iomap_fiemap'
arc-elf32-ld: inode.c:(.text+0x1c24): undefined reference to `iomap_fiemap'

- Naresh
