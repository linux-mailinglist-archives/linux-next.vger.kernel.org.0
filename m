Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7BD1FE87B
	for <lists+linux-next@lfdr.de>; Sat, 16 Nov 2019 00:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfKOXLB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 18:11:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26264 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727022AbfKOXLA (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Nov 2019 18:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573859459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yLM4au1w23R33zxZuZFR6tdhMj5Zj3PEZJcCBi1Jfdc=;
        b=W8Kqu3yM2bpwY13ydq0XoB7rDmPyNDaUSSUCLcveJNM+dSMxB4X8esmQDsDIQ+brtXCKYM
        inuQXWxoFdKNt4FrXrr0fropRzXyCEg+irIAy5LUtYapYwmTsHDSmtCMlGP87caGOUylRg
        rn68s8cz61sKeoPVQjidhNG83oc8PbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-Vg6chb-jMBaVijOWiQQ8aA-1; Fri, 15 Nov 2019 18:10:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42510800686;
        Fri, 15 Nov 2019 23:10:55 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 34CA766835;
        Fri, 15 Nov 2019 23:10:51 +0000 (UTC)
Date:   Fri, 15 Nov 2019 18:10:51 -0500
From:   Mike Snitzer <snitzer@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alasdair G Kergon <agk@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Thornber <dm-devel@redhat.com>,
        Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
Message-ID: <20191115231050.GA29649@redhat.com>
References: <20191115190525.77efdf6c@canb.auug.org.au>
 <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
 <20191116094620.497663ab@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20191116094620.497663ab@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Vg6chb-jMBaVijOWiQQ8aA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15 2019 at  5:46pm -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
>=20
> On Fri, 15 Nov 2019 08:17:48 -0800 Randy Dunlap <rdunlap@infradead.org> w=
rote:
> >
> > on i386:
> >=20
> > ld: drivers/md/dm-integrity.o: in function `calculate_device_limits':
> > dm-integrity.c:(.text.unlikely+0x1e9): undefined reference to `__udivdi=
3'
>=20
> Caused by commit
>=20
>   a236c37603bd ("dm integrity: fix excessive alignment of metadata runs")
>=20
> From the device-mapper tree.

Yes, I've pushed a fixed commit, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/=
commit/?h=3Dfor-next&id=3Dd537858ac8aaf4311b51240893add2fc62003b97

