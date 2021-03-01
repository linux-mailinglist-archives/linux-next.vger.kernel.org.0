Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 687D1327CCF
	for <lists+linux-next@lfdr.de>; Mon,  1 Mar 2021 12:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhCALHJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Mar 2021 06:07:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:53086 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233090AbhCALHE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Mar 2021 06:07:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C1E68AE03;
        Mon,  1 Mar 2021 11:06:22 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id F3A7CDA7B0; Mon,  1 Mar 2021 12:04:27 +0100 (CET)
Date:   Mon, 1 Mar 2021 12:04:27 +0100
From:   David Sterba <dsterba@suse.cz>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Raiber <martin@urbackup.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the btrfs
 tree
Message-ID: <20210301110427.GT7604@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Raiber <martin@urbackup.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20210127223918.1b3e4b3f@canb.auug.org.au>
 <20210215084634.06c1b430@canb.auug.org.au>
 <20210226103250.7b08a233@canb.auug.org.au>
 <20210226051626.GA2072@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226051626.GA2072@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 26, 2021 at 06:16:26AM +0100, Christoph Hellwig wrote:
> On Fri, Feb 26, 2021 at 10:32:50AM +1100, Stephen Rothwell wrote:
> > > >  -	return filemap_read(iocb, to, ret);
> > > >  +	if (iocb->ki_flags & IOCB_NOWAIT)
> > > >  +		iocb->ki_flags |= IOCB_NOIO;
> > > >  +
> > > > - 	ret = generic_file_buffered_read(iocb, to, ret);
> > > > ++	ret = filemap_read(iocb, to, ret);
> > > >  +
> > > >  +	if (iocb->ki_flags & IOCB_NOWAIT) {
> > > >  +		iocb->ki_flags &= ~IOCB_NOIO;
> > > >  +		if (ret == 0)
> > > >  +			ret = -EAGAIN;
> > > >  +	}
> > > >  +
> > > >  +	return ret;
> > > >   }
> 
> I think the above code looks completely bogus.  Instead whatever code
> in btrfs hecks for IOCB_NOIO to avoid blocking readahead should also
> check IOCB_NOWAIT.

Thanks for the comment, I've removed the patch from for-next and
notified the authors.
