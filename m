Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1A7DD72BB
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 12:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfJOKEL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 06:04:11 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:63131 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbfJOKEL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Oct 2019 06:04:11 -0400
Received: from 79.184.254.38.ipv4.supernova.orange.pl (79.184.254.38) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 2827a5d82acf5506; Tue, 15 Oct 2019 12:04:08 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the pm tree (Was: linux-next: build warning after merge of the pm tree)
Date:   Tue, 15 Oct 2019 12:04:08 +0200
Message-ID: <4823987.OjxUhv8yZC@kreacher>
In-Reply-To: <20191015101650.2a1541af@canb.auug.org.au>
References: <20191015100855.31b8a3d5@canb.auug.org.au> <20191015101650.2a1541af@canb.auug.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tuesday, October 15, 2019 1:16:50 AM CEST Stephen Rothwell wrote:
> 
> --Sig_/6GS1h5au_w04qPbsgg/ztsa
> Content-Type: text/plain; charset=US-ASCII
> Content-Transfer-Encoding: quoted-printable
> 
> Hi all,
> 
> On Tue, 15 Oct 2019 10:08:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
> wrote:
> >
> > After merging the pm tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >=20
> > In file included from include/linux/irqchip.h:14,
> >                  from arch/arm/kernel/irq.c:26:
> > include/linux/acpi.h:682:31: warning: 'struct acpi_device' declared insid=
> e parameter list will not be visible outside of this definition or declarat=
> ion
> >   682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2=
> , const char *uid2)
> >       |                               ^~~~~~~~~~~
> >=20
> > and many more.
> >=20
> > Introduced by commit
> >=20
> >   d1748b57dc88 ("ACPI / utils: Introduce acpi_dev_hid_uid_match() helper")
> >=20
> > CONFIG_ACPI is not set for this build.
> 
> This became a build failure for the powerpc ppc64_allmodconfig build:
> 
> In file included from include/linux/i2c.h:13,
>                  from arch/powerpc/platforms/pasemi/misc.c:14:
> include/linux/acpi.h:682:31: error: 'struct acpi_device' declared inside pa=
> rameter list will not be visible outside of this definition or declaration =
> [-Werror]
>   682 | acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, =
> const char *uid2)
>       |                               ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> (and many more)
> 
> I have used the pm tree from next-20191014 for today.

So this looks weird, because there is an acpi_dev_put() stub in
include/linux/acpi.h too in the same #else block and it takes a
(struct acpi_device *) pointer too and it has not been touched by
the commit in question.  So why has it built successfully so far?

Also I wonder why 0-day didn't warn about that commit.

Anyway, I've added an extra declaration of struct acpi_device to the #else
block in question to suppress the warning(s).



