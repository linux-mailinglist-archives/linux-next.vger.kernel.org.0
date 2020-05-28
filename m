Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C270B1E6293
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 15:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390478AbgE1Nob (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 09:44:31 -0400
Received: from verein.lst.de ([213.95.11.211]:56530 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390432AbgE1Nob (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 09:44:31 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0855268C4E; Thu, 28 May 2020 15:44:27 +0200 (CEST)
Date:   Thu, 28 May 2020 15:44:25 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build warnings after merge of the fsinfo tree
Message-ID: <20200528134425.GA16083@lst.de>
References: <20200528184017.503eeff1@canb.auug.org.au> <20200528201104.529e9bc5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528201104.529e9bc5@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 08:11:04PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> This should have been the block tree, not the fsinfo tree, of course.

Fix sent to Jens and the linux-block list, thanks for the report.
