Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9F3B3444
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 07:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfIPFF0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 01:05:26 -0400
Received: from ozlabs.org ([203.11.71.1]:47969 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbfIPFF0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Sep 2019 01:05:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46WvM64z0cz9sPq;
        Mon, 16 Sep 2019 15:05:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568610323;
        bh=EQabE8r3HeK1vfzgH3X6IqDqKY3HILHBl4Rvect7M5k=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=RmtIBX/52R4Y2VvxMf6ODCE/t4ODm91Zo4Ex4VWcj1grGHaDcrfns84f9YBMqaRLP
         RmWtzupGaJzZ8jPZZtr/aqJrXN6c5bbKLq1Kb+Xa8gOgEczGfyv6BPiO+/SZOujv9n
         O6hhXwpyEtimyF4vxBrs4pMJ2q08ldNOZHjs7bLiI6vjPW9Stcc32ubyA15Rk+jQSl
         Zs0ILdExqUArE90mohzUseXO7nkEjGtsAcfYNFJI6WdbbOCtBSknbrTOPNiaTUpyty
         pZDogQmFpgUeS/PBTqtzpAlQayzDribLFxZXokNMONGgkwYSio07uQlQb0bzRoSgeI
         Sa5CS9BCDnk4A==
Date:   Mon, 16 Sep 2019 06:05:14 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20190916013727.GT4352@sirena.co.uk>
References: <20190905160237.2e972a89@canb.auug.org.au> <20190916013727.GT4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: linux-next: no release today
To:     Mark Brown <broonie@kernel.org>
CC:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux-kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <D081BA7D-9074-441A-B6C3-A742B41FF111@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 16 September 2019 2:37:27 am GMT+01:00, Mark Brown <broonie@kernel=2Eorg=
> wrote:
>On Thu, Sep 05, 2019 at 04:02:37PM +1000, Stephen Rothwell wrote:
>
>> As I said yesterday, there will be no release today, or any day until
>> September 30=2E
>
>I'm going to try to provide some builds for this week (16th-20th)=2E
>There may also be a build for the 15th depending on how much rebuilding
>the rest of the trees is needed for the build I've got ongoing=2E

Hi Mark,

Thanks for this=2E  Don't stress too much, it should ease off a bit when L=
inus
starts merging trees=2E

Cheers,
Stephen Rothwell=20
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
