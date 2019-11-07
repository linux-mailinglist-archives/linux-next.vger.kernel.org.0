Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A8DF3A49
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 22:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfKGVSH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 16:18:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:47636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbfKGVSH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Nov 2019 16:18:07 -0500
Received: from localhost (unknown [69.71.4.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA5DC2077C;
        Thu,  7 Nov 2019 21:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573161486;
        bh=+J4FAIKTXaaTMUjiB9JwExcwXekKFRbj/8/L2DEZGfA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=gDEqAWSa5ZZIbcdBqNLxXP5Bq9FiF+tJfk5J7VKwv0fHvTOnAkwdeMMxvwyMmrE1u
         M1soAbjwF54DNbKn+WpoBNaHdPDxHjCz7Zfmdng1PWtQW/HA03X/dNziBxwPOkPXG+
         jxicxYHMDkodzwlwUgPlwUTwRQhvsAdsHL37JoII=
Date:   Thu, 7 Nov 2019 15:18:01 -0600
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Olof Johansson <olof@lixom.net>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: linux-next: manual merge of the pci tree with the arm-soc tree
Message-ID: <20191107211801.GA107543@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMjVUCd9bN=pggS-ECjMR42b0SqXKewsp+NYFSVqRgSWrg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 07, 2019 at 10:27:20AM -0800, Olof Johansson wrote:
> On Wed, Nov 6, 2019 at 2:46 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the pci tree got a conflict in:
> >
> >   arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> >
> > between commit:
> >
> >   68e36a429ef5 ("arm64: dts: ls1028a: Move thermal-zone out of SoC")
> >
> > from the arm-soc tree and commit:
> >
> >   8d49ebe713ab ("arm64: dts: ls1028a: Add PCIe controller DT nodes")
> 
> Bjorn, we ask that driver subsystem maintainers don't pick up DT
> changes since it causes conflicts like these.
> 
> Is it easy for you to drop this patch, or are we stuck with it?
> Ideally it should never have been sent to you in the first place. :(

Lorenzo, is it feasible for you to drop it from your pci/layerscape
branch and repush it?  If so, I can redo the merge into my "next"
branch.

Bjorn
