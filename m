Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55A2112A029
	for <lists+linux-next@lfdr.de>; Tue, 24 Dec 2019 11:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfLXKoO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 24 Dec 2019 05:44:14 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42003 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfLXKoO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Dec 2019 05:44:14 -0500
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D507A240007;
        Tue, 24 Dec 2019 10:44:11 +0000 (UTC)
Date:   Tue, 24 Dec 2019 11:44:10 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Herring <robherring2@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the devicetree tree
Message-ID: <20191224114410.0d72c72f@xps13>
In-Reply-To: <20191221143211.47eea79d@canb.auug.org.au>
References: <20191221143211.47eea79d@canb.auug.org.au>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, Rob,

Stephen Rothwell <sfr@canb.auug.org.au> wrote on Sat, 21 Dec 2019
14:32:11 +1100:

> Hi all,
> 
> n commit
> 
>   13670c493ab8 ("dt-bindings: phy: Fix the PX30 DSI PHY compatible in the example")
> 
> Fixes tag
> 
>   Fixes: 3200df7fa1d6 ("dt-bindings: phy: add yaml binding for rockchip,px30-dsi-dphy")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 3817c7961179 ("dt-bindings: phy: add yaml binding for rockchip,px30-dsi-dphy")

Sorry for the mistake, I took the hash from Heiko's tree. This is
indeed the right one.

Thanks,
Miquèl
