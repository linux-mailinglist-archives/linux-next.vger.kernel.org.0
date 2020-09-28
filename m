Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFC927A733
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 08:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbgI1GFW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 02:05:22 -0400
Received: from verein.lst.de ([213.95.11.211]:34289 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbgI1GFW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 02:05:22 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id E92CC67373; Mon, 28 Sep 2020 08:05:20 +0200 (CEST)
Date:   Mon, 28 Sep 2020 08:05:20 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>, Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200928060520.GB15041@lst.de>
References: <20200928113142.0e38a8e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928113142.0e38a8e8@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

That is the crude fix, and it should work.  I'd much rather make
compat_iovec always available, though.  Let me give that a spin.
