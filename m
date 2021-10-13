Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D080642CDF2
	for <lists+linux-next@lfdr.de>; Thu, 14 Oct 2021 00:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhJMWbC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 18:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhJMWav (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Oct 2021 18:30:51 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100B0C061773;
        Wed, 13 Oct 2021 15:28:43 -0700 (PDT)
Received: from crub (pd95f1d7c.dip0.t-ipconnect.de [217.95.29.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: agust@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F3BB283373;
        Thu, 14 Oct 2021 00:28:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634164122;
        bh=B95QcUf/6Ga2ClYCUrSKCql07sscyHZ8N2t2fDd9q4E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O2yxj5YJplBDn7B4TvhzKFB2cDRdsBlEC7Nxxc2iw9SfUWaSbxID+ps/Lv0KYPTOF
         mmDEhp3zOnc4Y/lA1IQzMbsZ8NerLrxhcH+J3EzK9v4QskddcU09A+twroelmRDKQK
         XHhBiHy7ERjRCEEbKnbVdV376YxYA/hqwZ+goDDO03IUhUjLiL8An8h9DDMTOEbHIc
         vK/ks/Ja54i12Nn8h/aebDv8s+MAseoLbgroMaCHxGkZxvF4pSJMrUZ5CVDvJfXJDw
         umZaP2sp1BxKzxLWh900CkSQDYTfC64G0v9csYeYaAjufVAS6X+L8FfZK9z8z6CHnw
         t6yAuHHayXfMg==
Date:   Thu, 14 Oct 2021 00:28:41 +0200
From:   Anatolij Gustschin <agust@denx.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20211014002841.7c4ccf2f@crub>
In-Reply-To: <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
References: <20211008164728.30e3d3a3@canb.auug.org.au>
        <20211011082704.3cff4568@canb.auug.org.au>
        <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
        <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
        <20211014001232.3becbe99@crub>
        <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 13 Oct 2021 17:17:25 -0500
Rob Herring robh+dt@kernel.org wrote:
...
>In general, you shouldn't need to be changing the drivers. Can you
>tell me which warnings need driver changes?

ethernet and mdio drivers share registers, so they use same unit-address:

arch/powerpc/boot/dts/tqm5200.dts:127.17-133.5: Warning (unique_unit_address): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)

arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
  also defined at arch/powerpc/boot/dts/digsy_mtc.dts:60.17-62.5

Anatolij
