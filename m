Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAAA52401DF
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 08:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgHJGLJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Aug 2020 02:11:09 -0400
Received: from verein.lst.de ([213.95.11.211]:59941 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgHJGLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Aug 2020 02:11:09 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id BFFBD68AFE; Mon, 10 Aug 2020 08:11:06 +0200 (CEST)
Date:   Mon, 10 Aug 2020 08:11:06 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: linux-next: manual merge of the set_fs tree with the powerpc
 tree
Message-ID: <20200810061106.GA29318@lst.de>
References: <20200717190931.701ddf08@canb.auug.org.au> <20200809185726.5d8e5f55@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200809185726.5d8e5f55@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

please drop my set_fs tree from linux-next.  It is not going to be
merged for 5.9 in this form.

Thanks!
