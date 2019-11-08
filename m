Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D4BF455D
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 12:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbfKHLH4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 06:07:56 -0500
Received: from foss.arm.com ([217.140.110.172]:40706 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbfKHLH4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Nov 2019 06:07:56 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B68BE31B;
        Fri,  8 Nov 2019 03:07:55 -0800 (PST)
Received: from e121166-lin.cambridge.arm.com (unknown [10.1.196.255])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43C173F719;
        Fri,  8 Nov 2019 03:07:54 -0800 (PST)
Date:   Fri, 8 Nov 2019 11:07:44 +0000
From:   Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xiaowei Bao <xiaowei.bao@nxp.com>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: linux-next: manual merge of the pci tree with the arm-soc tree
Message-ID: <20191108110736.GA10708@e121166-lin.cambridge.arm.com>
References: <CAOesGMjVUCd9bN=pggS-ECjMR42b0SqXKewsp+NYFSVqRgSWrg@mail.gmail.com>
 <20191107211801.GA107543@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107211801.GA107543@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 07, 2019 at 03:18:01PM -0600, Bjorn Helgaas wrote:
> On Thu, Nov 07, 2019 at 10:27:20AM -0800, Olof Johansson wrote:
> > On Wed, Nov 6, 2019 at 2:46 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > Today's linux-next merge of the pci tree got a conflict in:
> > >
> > >   arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > >
> > > between commit:
> > >
> > >   68e36a429ef5 ("arm64: dts: ls1028a: Move thermal-zone out of SoC")
> > >
> > > from the arm-soc tree and commit:
> > >
> > >   8d49ebe713ab ("arm64: dts: ls1028a: Add PCIe controller DT nodes")
> > 
> > Bjorn, we ask that driver subsystem maintainers don't pick up DT
> > changes since it causes conflicts like these.
> > 
> > Is it easy for you to drop this patch, or are we stuck with it?
> > Ideally it should never have been sent to you in the first place. :(
> 
> Lorenzo, is it feasible for you to drop it from your pci/layerscape
> branch and repush it?  If so, I can redo the merge into my "next"
> branch.

Done. Should we ignore all dts updates from now onwards ?

Thanks,
Lorenzo
