Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A323E32BB6A
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhCCMYY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575632AbhCBWuE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 17:50:04 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88ECCC061756;
        Tue,  2 Mar 2021 14:49:23 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dqskk3fWpz9sRR;
        Wed,  3 Mar 2021 09:49:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1614725359;
        bh=HFXBoTB9QkIdpfj1nthDl4GEiFA8/e8waHgz50PRC8I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FoEWol+UK+GJoezLROpzsabdlUI03TbZ4RDyPvqk3eDCGhyynEf972LjugnqBrJIz
         OPCWA2PWLBK0S3xQNe/T4dHP5oe6TrnfPp/4b+FmS7t0gAdslcRp/IGhSRGTXwJRZD
         eGqsvxvXt+syiaFA/17r59OhQOC0P/4j3CuETrYmyKNhwqq8DU8E+icn+mOaoTfc/j
         IFywYYKkO5/M1IXpJS6E0SWjQ62oMk1hV5NEYWlmRx7ZrxRr0pn4Mq7WQ7p26D8jrJ
         bKbU3+cfxYG+1L4o/wPfydWM2fRHrt4NhzGBkvbf64opIEA2eExypKkfl7d3fhHo3J
         fyV1WT+IWN0RA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the powerpc-fixes tree
In-Reply-To: <6113ab65-7b3c-07f0-2813-76ddaa4c7236@kleine-koenig.org>
References: <20210302112131.5bb7b08b@canb.auug.org.au>
 <87pn0is3wg.fsf@mpe.ellerman.id.au>
 <6113ab65-7b3c-07f0-2813-76ddaa4c7236@kleine-koenig.org>
Date:   Wed, 03 Mar 2021 09:49:15 +1100
Message-ID: <87eegxrx1w.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> writes:
> Hello,
>
> On 3/2/21 3:09 AM, Michael Ellerman wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>> Hi all,
>>>
>>> After merging the powerpc-fixes tree, today's linux-next build (powerpc
>>> allyesconfig) failed like this:
>>>
>>> drivers/net/ethernet/ibm/ibmvnic.c:5399:13: error: conflicting types fo=
r 'ibmvnic_remove'
>>>   5399 | static void ibmvnic_remove(struct vio_dev *dev)
>>>        |             ^~~~~~~~~~~~~~
>>> drivers/net/ethernet/ibm/ibmvnic.c:81:12: note: previous declaration of=
 'ibmvnic_remove' was here
>>>     81 | static int ibmvnic_remove(struct vio_dev *);
>>>        |            ^~~~~~~~~~~~~~
>>>
>>> Caused by commit
>>>
>>>    1bdd1e6f9320 ("vio: make remove callback return void")
>>=20
>> Gah, is IBMVNIC in any of our defconfigs?! ... no it's not.
>
> Would you accept a patch to add the driver to one of the defconfigs as=20
> an excuse for the build breakage I created?

Thanks, but I already sent a patch adding it.

We should really have these drivers enabled in our defconfig, so that's
on us.

cheers
