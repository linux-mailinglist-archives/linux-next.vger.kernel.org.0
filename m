Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AE3315368
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 17:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhBIQHK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 11:07:10 -0500
Received: from verein.lst.de ([213.95.11.211]:47225 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232658AbhBIQHJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 11:07:09 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 64E3567373; Tue,  9 Feb 2021 17:06:27 +0100 (CET)
Date:   Tue, 9 Feb 2021 17:06:27 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <20210209160627.GA9188@lst.de>
References: <20210209210843.3af66662@canb.auug.org.au> <YCKnRPRTDyfGxnBC@gunter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCKnRPRTDyfGxnBC@gunter>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 09, 2021 at 04:16:20PM +0100, Jessica Yu wrote:
> Hmm, these errors don't look like it's related to that particular commit. I was
> able to reproduce these weird autoksym errors even without any modules-next
> patches applied, and on a clean v5.11-rc7 tree.

I OTOH can't reproduce it at all with either linux-next or module-next
and the powerpc allyesconfig..
