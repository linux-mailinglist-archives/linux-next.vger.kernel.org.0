Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55663232539
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 21:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2TTT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 15:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2TTT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 15:19:19 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8A5C061794;
        Wed, 29 Jul 2020 12:19:19 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k0rba-0059xJ-9E; Wed, 29 Jul 2020 19:19:10 +0000
Date:   Wed, 29 Jul 2020 20:19:10 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200729191910.GD951209@ZenIV.linux.org.uk>
References: <20200729115645.3fe3beec@canb.auug.org.au>
 <20200729063305.GA32038@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729063305.GA32038@lst.de>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 08:33:05AM +0200, Christoph Hellwig wrote:
> Thanks,
> 
> I've sent out a fixed version.

#work.quota-compat and #for-next rebuilt (and pushed) with it...
