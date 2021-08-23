Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2263F4C39
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 16:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhHWOUP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 10:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbhHWOUP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 10:20:15 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19A8C061575;
        Mon, 23 Aug 2021 07:19:32 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BF75C559;
        Mon, 23 Aug 2021 14:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF75C559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629728371; bh=+A2veN2danoxcwS7sX/Lap+UU+FoQD+t06BbYIv/mQA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QOkt6awRxvbY72UFMEgI/Fb/xrFgVrvjMX/cZuCFSvs/CfhjPVjIT4L8cL3w4o+1i
         kY3SLEd7D3OWCWkIaEZGyUD8gPTRJxEQrjIhbwGswzz2BOUs12tEtVp+1YTpYAJw2l
         Ak1NWibjuKRi6Mn2rjFS97+yjoCIfv6ZsujId/yKkHwsgCvWpctdA8moIlebmUDa03
         /qdY30E+Z2tAHPFIa2iXd7eT6om5CP759mM2Pvni+YP0hx23BLB9ehGsKPuJwpNLfM
         w7umjkbiyfX7o61Nw3JrdNy+J9Lu8WM04/Iku/CYrBKdVTU4xiFPVAW13UvEUAyvkq
         5XmMD9bcg+11Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
In-Reply-To: <20210823204803.7cb76778@canb.auug.org.au>
References: <20210823195540.4d7363ed@canb.auug.org.au>
 <20210823204803.7cb76778@canb.auug.org.au>
Date:   Mon, 23 Aug 2021 08:19:30 -0600
Message-ID: <87a6l8p7kd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> [cc'ing Jon in case he can fix the sphix hang - or knows anything about it]

That's new to me.  Which version of sphinx?

jon
