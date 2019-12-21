Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C17CA128823
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2019 09:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfLUIcO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 21 Dec 2019 03:32:14 -0500
Received: from verein.lst.de ([213.95.11.211]:50403 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbfLUIcO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 21 Dec 2019 03:32:14 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3207968B20; Sat, 21 Dec 2019 09:32:12 +0100 (CET)
Date:   Sat, 21 Dec 2019 09:32:11 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 generic-ioremap tree
Message-ID: <20191221083211.GA3465@lst.de>
References: <20191218133025.15356802@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218133025.15356802@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Andrew,

do you plan to send this to Linus for 5.5 to fix the warning from the
new devm_ioremap_uc addition in this cycle?  If so I can rebase the
ioremap tree one more time.
