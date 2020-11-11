Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6E62AEBA6
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 09:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgKKI2t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 03:28:49 -0500
Received: from verein.lst.de ([213.95.11.211]:39249 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725960AbgKKI2s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Nov 2020 03:28:48 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 26B746736F; Wed, 11 Nov 2020 09:28:43 +0100 (CET)
Date:   Wed, 11 Nov 2020 09:28:42 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        akpm@linux-foundation.org, dan.j.williams@intel.com,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-nvdimm@lists.01.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        clang-built-linux@googlegroups.com,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH 2/2] mm: simplify follow_pte{,pmd}
Message-ID: <20201111082842.GA23677@lst.de>
References: <20201029101432.47011-3-hch@lst.de> <20201111022122.1039505-1-ndesaulniers@google.com> <20201111081800.GA23492@lst.de> <673267d5-93f5-7278-7a9d-a7b35ede6d48@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673267d5-93f5-7278-7a9d-a7b35ede6d48@de.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 11, 2020 at 09:26:20AM +0100, Christian Borntraeger wrote:
> 
> On 11.11.20 09:18, Christoph Hellwig wrote:
> > On Tue, Nov 10, 2020 at 06:21:22PM -0800, Nick Desaulniers wrote:
> >> Sorry, I think this patch may be causing a regression for us for s390?
> >> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/432129279#L768
> >>
> >> (via https://lore.kernel.org/linux-mm/20201029101432.47011-3-hch@lst.de)
> > 
> > Hmm, the call to follow_pte_pmd in the s390 code does not actually exist
> > in my tree.
> 
> This is a mid-air collision in linux-next between
> 
> b2ff5796a934 ("mm: simplify follow_pte{,pmd}")
> a67a88b0b8de ("s390/pci: remove races against pte updates")

Ah.  The fixup is trivial: just s/follow_pte_pmd/follow_pte/.
