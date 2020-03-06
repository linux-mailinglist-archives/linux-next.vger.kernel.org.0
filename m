Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149F117B9C3
	for <lists+linux-next@lfdr.de>; Fri,  6 Mar 2020 11:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbgCFKD0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Mar 2020 05:03:26 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:29200 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgCFKD0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Mar 2020 05:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583489002;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=c11MUTAoBFghZBdD4CTF4L9tszjd6tD8y5eT0h8wNtw=;
        b=pexEd/QDmFEomb3BEReFsAKnGb7wuqs8J9hwWI7IBX4q7PoDt9WJvfVOEPNGmb7FtI
        FemmlCVO2EBKINp5JNrmr+SiqN6rui61yxFc224jIb7x+1BKKMKbb2UhCqeBJ7vJR8+p
        i0R8QoKUSqWv0dWjrXFdMWkYORxMWd/gR6nXznhROUxGibTT83xR68zEvcEJHeUWfqgk
        xNqslJ1wRbBxINuQFGoe/INGSV1xO1XgJzuHmN/Fl7PN49Hl7l6v3kfqXXxAMVVU6v03
        pZ0TTm9NEXHk+ZZCNxsk//AbInjFBkde1e1v06VA0zkaE8SQS7v2VCOWcPwwuv/Xh0XJ
        0RFQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaaXAgMzQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw26A39XQJ
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 6 Mar 2020 11:03:09 +0100 (CET)
Subject: Re: linux-next: build warning after merge of the nvmem tree
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200306152827.6fe507bd@canb.auug.org.au>
Date:   Fri, 6 Mar 2020 11:03:08 +0100
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Mathieu Malaterre <malat@debian.org>,
        Paul Cercueil <paul@crapouillou.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <00D4DF40-E9A8-41AC-B1DA-4D656B6AC4F4@goldelico.com>
References: <20200306152827.6fe507bd@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3124)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

> Am 06.03.2020 um 05:28 schrieb Stephen Rothwell =
<sfr@canb.auug.org.au>:
>=20
> Hi all,
>=20
> After merging the nvmem tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> In file included from include/linux/clk.h:13,
>                 from drivers/nvmem/jz4780-efuse.c:25:
> drivers/nvmem/jz4780-efuse.c: In function 'jz4780_efuse_read':
> include/linux/kernel.h:842:29: warning: comparison of distinct pointer =
types lacks a cast
>  842 |   (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
>      |                             ^~
> include/linux/kernel.h:856:4: note: in expansion of macro =
'__typecheck'
>  856 |   (__typecheck(x, y) && __no_side_effects(x, y))
>      |    ^~~~~~~~~~~
> include/linux/kernel.h:866:24: note: in expansion of macro =
'__safe_cmp'
>  866 |  __builtin_choose_expr(__safe_cmp(x, y), \
>      |                        ^~~~~~~~~~
> include/linux/kernel.h:875:19: note: in expansion of macro =
'__careful_cmp'
>  875 | #define min(x, y) __careful_cmp(x, y, <)
>      |                   ^~~~~~~~~~~~~
> drivers/nvmem/jz4780-efuse.c:76:24: note: in expansion of macro 'min'
>   76 |   unsigned int chunk =3D min(bytes, (start + JZ_EFU_READ_SIZE)
>      |                        ^~~
>=20
> Introduced by commit
>=20
>  50a09dfd394a ("nvmem: add driver for JZ4780 efuse")

The new kbuild robot message is more precise.

drivers/nvmem/jz4780-efuse.c:76:38: sparse: sparse: incompatible types =
in comparison expression (different type sizes):
drivers/nvmem/jz4780-efuse.c:76:38: sparse:    unsigned long *
drivers/nvmem/jz4780-efuse.c:76:38: sparse:    unsigned int *

A look into the code:

/* main entry point */
static int jz4780_efuse_read(void *context, unsigned int offset,
			     void *val, size_t bytes)
{
	struct jz4780_efuse *efuse =3D context;

	while (bytes > 0) {
		unsigned int start =3D offset & ~(JZ_EFU_READ_SIZE - 1);
		unsigned int chunk =3D min(bytes, (start + =
JZ_EFU_READ_SIZE)
					 - offset);

The problem seems to be that size_t is not always compatible to
unsigned int on all machines and compilers. My cross-gcc for MIPS
did not complain. kbuild robot tried for ARCH=3Dx86_64 and in the
first warning for GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv=20

So I think we have to use

		size_t start =3D offset & ~(JZ_EFU_READ_SIZE - 1);
		size_t chunk =3D min(bytes, (start + JZ_EFU_READ_SIZE)
					 - offset);

I'l send a patch (after trying on MIPS).

BR and thanks,
Nikolaus

