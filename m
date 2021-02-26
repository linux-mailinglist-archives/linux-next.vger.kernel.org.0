Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4697325CF3
	for <lists+linux-next@lfdr.de>; Fri, 26 Feb 2021 06:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhBZFRL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Feb 2021 00:17:11 -0500
Received: from verein.lst.de ([213.95.11.211]:44476 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229526AbhBZFRK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 26 Feb 2021 00:17:10 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7EBA768BEB; Fri, 26 Feb 2021 06:16:26 +0100 (CET)
Date:   Fri, 26 Feb 2021 06:16:26 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Raiber <martin@urbackup.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 btrfs tree
Message-ID: <20210226051626.GA2072@lst.de>
References: <20210127223918.1b3e4b3f@canb.auug.org.au> <20210215084634.06c1b430@canb.auug.org.au> <20210226103250.7b08a233@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226103250.7b08a233@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 26, 2021 at 10:32:50AM +1100, Stephen Rothwell wrote:
> > >  -	return filemap_read(iocb, to, ret);
> > >  +	if (iocb->ki_flags & IOCB_NOWAIT)
> > >  +		iocb->ki_flags |= IOCB_NOIO;
> > >  +
> > > - 	ret = generic_file_buffered_read(iocb, to, ret);
> > > ++	ret = filemap_read(iocb, to, ret);
> > >  +
> > >  +	if (iocb->ki_flags & IOCB_NOWAIT) {
> > >  +		iocb->ki_flags &= ~IOCB_NOIO;
> > >  +		if (ret == 0)
> > >  +			ret = -EAGAIN;
> > >  +	}
> > >  +
> > >  +	return ret;
> > >   }

I think the above code looks completely bogus.  Instead whatever code
in btrfs hecks for IOCB_NOIO to avoid blocking readahead should also
check IOCB_NOWAIT.
