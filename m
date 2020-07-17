Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C002232F7
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 07:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQFd1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 01:33:27 -0400
Received: from verein.lst.de ([213.95.11.211]:37158 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbgGQFd1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Jul 2020 01:33:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 041A468BEB; Fri, 17 Jul 2020 07:33:24 +0200 (CEST)
Date:   Fri, 17 Jul 2020 07:33:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Takashi Iwai <tiwai@suse.de>, Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the sound tree
Message-ID: <20200717053324.GA9319@lst.de>
References: <20200717130112.469f8f8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717130112.469f8f8f@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 17, 2020 at 01:01:12PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

No, the sound commit needs to be reverted.  Drivers has absolutely not
business poking into DMA layer internals.
