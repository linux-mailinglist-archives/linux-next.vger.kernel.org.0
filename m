Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEBC428833
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbhJKH7Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:59:24 -0400
Received: from mail-4317.proton.ch ([185.70.43.17]:20865 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbhJKH7V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 03:59:21 -0400
Date:   Mon, 11 Oct 2021 07:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1633939040;
        bh=bPUo23XnKaWR9gAuxsFlt500SGKQSmr/055s768a5ps=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Qhrj4twJlJ2enHmx7RxbnCq2+Ya2x7CmFLKxYw31T9EGDj2JaqRhDcyY4cEmnIgKO
         auDs2ydqqU8qXH0R9IQooC4H1sGKtjI8U2sH4zz6OImzU/Fsw4ePT0VDArNs3uFR7+
         d0BrEAgjop3btzf3dG3sHi7qmRaiu4vPsxOIUaM4A8xV5IbwTgtefMvj8BJ0IgShlx
         w94dW+CptY/a1KzsinLmlEbcTEXNsBesGf+j62XQSbJO12WzgcjGRmA7B9hcd+XZKM
         BXkKNt2Nk8C+ZG5DR3V7cfFn90E4Lu+z0UQwwWhZBD6yUef1pntmWdJxS0uRDC6/wn
         vn6/xoQtezIAQ==
To:     Christoph Hellwig <hch@lst.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <eOlxebs_u0NKPwzSFL2q48CRHVKEXqiWyoQcHWDsG5qHnhrrphhwczUtgd4bE1o1988Jja35uxf3pWwn2lU8I_5Tmyk1WzeKYQ7yi9qS4sc=@emersion.fr>
In-Reply-To: <20211011075125.GA11098@lst.de>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr> <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com> <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr> <20211011073348.GA10672@lst.de> <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr> <20211011074316.GA10882@lst.de> <XrjqMK5E95uVkQJ-wCjostUwiUD_39UdfIJzQhmnSwZO3aStGYHAxf9QsACe2WZ6vUn08BoW5X5Ya-tazSy0Iwn2jLLrCQDKxlJ6uWXLGaA=@emersion.fr> <20211011075125.GA11098@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Monday, October 11th, 2021 at 09:51, Christoph Hellwig <hch@lst.de> wrot=
e:

> On Mon, Oct 11, 2021 at 07:49:44AM +0000, Simon Ser wrote:
> > Have you heard about the kernel no-regression rule? Here, we can't enab=
le a new
> > feature because that would regress user-space which mis-uses the kernel=
 uAPI.
>
> Then you can't enable the feature without an explicit opt-in from
> userspace.  This ain't rocket science.

No, we can't have a "I_AM_NOT_BROKEN" ioctl for each and every uAPI mis-use=
.
User-space detection has been determined to be the best course of action.

> > If your reply wasn't aggressive, I don't know what it is.
>
> If there is one thing I find agressive it is your extreme passive
> aggressive behavior.

Come on. I'm just asking you to be civil, that's all. But that seems too mu=
ch.

* * *

I guess I'll just inline these functions in the driver then, if a revert wi=
ll
be NACK'ed by you?
