Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6FB4288AC
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 10:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhJKIYt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 04:24:49 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:42354 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235103AbhJKIY1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 04:24:27 -0400
Date:   Mon, 11 Oct 2021 08:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1633940504;
        bh=B0gd5nUP0yYSh5GJBfd4sJA35hrT0X4kACSzyDpxVUc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Mo7ixwiBjlj1Qj7CORVeKhtZg3S5loGSJDtw1CYB8cQedEIrc6l483SXB0/GOEW2l
         HsCJFtuegB8fKrhrX1jiVabu7IRMSCTd5QiHrf1oZDjnUw+1tFvXTDPLMTT3nIzdaC
         TEIdwsGYNc0Bl3Gm6mzBd352oa2gwCx4FY0XTycuDSK7t2jAPGh7DEe5GcBUxAsJwB
         HfHixDTjvOp7bzxN6EgC14cPAYRnAd1ysT2VKSvdnyvHzor+99rNDKeRSAufnDU66q
         Kg87VJGmCcFYqeuQL/VYtjjnqG2dw3Z0QeWhiSDCyeaqQNUJryQH18wycvk+Fq0Lp0
         1otZr0EjIgvVQ==
To:     Christoph Hellwig <hch@lst.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <I4IG-HGTQl3WHcdp7MrnMOrQZwL4HhudvbFPBKneSpZGbC20QrEL4YaO7H4YDaQvfpG1vkzovugRwgV_Qu5DMDQoCbdCK2SRESC2yoP1T3Y=@emersion.fr>
In-Reply-To: <20211011080135.GA11242@lst.de>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr> <20211011073348.GA10672@lst.de> <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr> <20211011074316.GA10882@lst.de> <XrjqMK5E95uVkQJ-wCjostUwiUD_39UdfIJzQhmnSwZO3aStGYHAxf9QsACe2WZ6vUn08BoW5X5Ya-tazSy0Iwn2jLLrCQDKxlJ6uWXLGaA=@emersion.fr> <20211011075125.GA11098@lst.de> <eOlxebs_u0NKPwzSFL2q48CRHVKEXqiWyoQcHWDsG5qHnhrrphhwczUtgd4bE1o1988Jja35uxf3pWwn2lU8I_5Tmyk1WzeKYQ7yi9qS4sc=@emersion.fr> <20211011080135.GA11242@lst.de>
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

On Monday, October 11th, 2021 at 10:01, Christoph Hellwig <hch@lst.de> wrot=
e:

> On Mon, Oct 11, 2021 at 07:57:17AM +0000, Simon Ser wrote:
> > No, we can't have a "I_AM_NOT_BROKEN" ioctl for each and every uAPI mis=
-use.
> > User-space detection has been determined to be the best course of actio=
n.
>
> If your API addition breaks userspace, yes you need an add-in.

It's not an API addition. It's a ChromeOS fix that breaks my user-space.

> With your completely broken change you cement in a mapping of an executab=
le
> name to map to what you consider a "bug" without any way to fix it up.

If that's the only concern, it'd be very easy to add a CAP_ATOMIC >=3D 2 ch=
eck
like we have for Xorg. This would make it so ChromeOS can eventually opt-ou=
t
of the quirk.
