Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB743228F8
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 11:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhBWKpQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 05:45:16 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:32752 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbhBWKpP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 05:45:15 -0500
Date:   Tue, 23 Feb 2021 10:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1614077065; bh=39RPlxQWGsqc110DvGaTPapbMeScM3H7W2UqSxyya+s=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=FPnplCBme01eJdQnthCyxDdCbTB7Kn2TG1PBMwkWe7N8cOyHlwekdzlAHmVPknCPP
         ZF0ZJISa+Stfa80R00Zbhc3Hcuh3ti2VHfTzDJJ3gpRUvX0CMnm1k1+6Hfbw0lOjQA
         6B7HtyXoGmt9TU5VxnP9Lp7EdhBM7avPMVfAHlTF4QcJ1026Eix05pjmAGXFdRaoy9
         LIrvgLAx45Shj+XCl4y7/MUhi01Ft+LJk62lSs2mYq0tdeEc+iDPxgpQqiAMKkBqiw
         c/kePy7UHPIKsViQNnhsuGC/4xd3nnOJTbr566uq2JYq4ZE3D76FCj31inlphEWkDP
         CgmJVwwhIfb/g==
To:     Stephen Rothwell <sfr@canb.auug.org.au>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Kees Cook <keescook@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: linux-next: manual merge of the kspp tree with the mips tree
Message-ID: <20210223104411.4155-1-alobakin@pm.me>
In-Reply-To: <20210223104950.1f754320@canb.auug.org.au>
References: <20210118150804.378ac9f3@canb.auug.org.au> <20210215074726.60c45281@canb.auug.org.au> <20210223104950.1f754320@canb.auug.org.au>
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

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 23 Feb 2021 10:49:50 +1100

> Hi all,

Hi,

> On Mon, 15 Feb 2021 07:47:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Mon, 18 Jan 2021 15:08:04 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > >
> > > Today's linux-next merge of the kspp tree got a conflict in:
> > >
> > >   include/asm-generic/vmlinux.lds.h
> > >
> > > between commits:
> > >
> > >   9a427556fb8e ("vmlinux.lds.hf41b233de0ae: catch compound literals i=
nto data and BSS")
> > >   f41b233de0ae ("vmlinux.lds.h: catch UBSAN's "unnamed data" into dat=
a")
> > >
> > > from the mips tree and commit:
> > >
> > >   dc5723b02e52 ("kbuild: add support for Clang LTO")
> > >
> > > from the kspp tree.
> > >
> > > I fixed it up (9a427556fb8e and dc5723b02e52 made the same change to
> > > DATA_MAIN, which conflicted with the change in f41b233de0ae) and can
> > > carry the fix as necessary. This is now fixed as far as linux-next is
> > > concerned, but any non trivial conflicts should be mentioned to your
> > > upstream maintainer when your tree is submitted for merging. You may
> > > also want to consider cooperating with the maintainer of the
> > > conflicting tree to minimise any particularly complex conflicts.
> >
> > With the merge window about to open, this is a reminder that this
> > conflict still exists.
>
> This is now a conflict between the kspp tree and Linus' tree.

Kees prepared a Git pull of kspp tree for Linus, this will be resolved
soon.

> --
> Cheers,
> Stephen Rothwell

Al

