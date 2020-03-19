Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFEF218AB2E
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 04:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgCSDah (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 23:30:37 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:54022 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726596AbgCSDah (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2020 23:30:37 -0400
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net [72.93.95.157])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 02J3UNjL022389
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Mar 2020 23:30:23 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 2DE8E420EBA; Wed, 18 Mar 2020 23:30:23 -0400 (EDT)
Date:   Wed, 18 Mar 2020 23:30:23 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the random tree
Message-ID: <20200319033023.GB1067245@mit.edu>
References: <20200302144452.6a7c4907@canb.auug.org.au>
 <20200306155348.7bdc9622@canb.auug.org.au>
 <20200310121747.GA49602@lakrids.cambridge.arm.com>
 <20200310144618.GC58231@mit.edu>
 <20200316165923.043f4454@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316165923.043f4454@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 16, 2020 at 04:59:23PM +1100, Stephen Rothwell wrote:
> > Yes, that looks fine.  Reordering the functions to move them under the
> > #ifdefs will make the code less readable, and adding extra
> > #ifdef/#endif would also make things less readable.
> > 
> > Thanks for the patch, will apply.
> 
> How are we going with this?

I've applied and pushed out Mark's patch.

     	     	 	    	   - Ted
