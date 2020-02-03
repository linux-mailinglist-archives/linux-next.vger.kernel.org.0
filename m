Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A964150069
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2020 02:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgBCB6R convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Sun, 2 Feb 2020 20:58:17 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:44070 "EHLO
        smtp2200-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726670AbgBCB6R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 2 Feb 2020 20:58:17 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.129933|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.206018-0.00306025-0.790922;DS=CONTINUE|ham_social|0.0175627-0.000733147-0.981704;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03305;MF=ren_guo@c-sky.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.Gk95N9p_1580695094;
Received: from it-c02z45m7lvcf.lan(mailfrom:ren_guo@c-sky.com fp:SMTPD_---.Gk95N9p_1580695094)
          by smtp.aliyun-inc.com(10.147.41.137);
          Mon, 03 Feb 2020 09:58:14 +0800
Content-Type: text/plain;
        charset=gb2312
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: linux-next: bad rebase of the csky tree
From:   Guo Ren <ren_guo@c-sky.com>
In-Reply-To: <20200203074151.05bfe914@canb.auug.org.au>
Date:   Mon, 3 Feb 2020 09:58:13 +0800
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <98C40432-86BC-4DBD-9896-45B7BB049E7E@c-sky.com>
References: <20200203074151.05bfe914@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Sorry got it, I’ll deal with it

Best Regards
  Guo Ren



> 在 2020年2月3日，上午4:41，Stephen Rothwell <sfr@canb.auug.org.au> 写道：
> 
> Hi all,
> 
> The rebase of the csky tree has rebased some of the commits from Linus'
> tree as well.  Please do not rebase your tree unnecessarily and especially
> not during the merge window.  And be more careful about how you do
> rebases if they are necessary.
> 
> -- 
> Cheers,
> Stephen Rothwell

