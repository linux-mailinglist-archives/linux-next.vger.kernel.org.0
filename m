Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D55B91710C6
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 06:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgB0F61 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 00:58:27 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10264 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgB0F60 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 00:58:26 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e575a5d0000>; Wed, 26 Feb 2020 21:57:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Feb 2020 21:58:26 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Feb 2020 21:58:26 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Feb
 2020 05:58:25 +0000
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kvms390 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>
References: <20200227141148.05d7d502@canb.auug.org.au>
X-Nvconfidentiality: public
From:   John Hubbard <jhubbard@nvidia.com>
Message-ID: <1217420e-42e4-9179-883f-125cf278caec@nvidia.com>
Date:   Wed, 26 Feb 2020 21:58:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227141148.05d7d502@canb.auug.org.au>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582783069; bh=f8HSLSy3S+SiQxggpzNoT67i9P+jtOS+iEOP4MaCstc=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ZLXsRjyR4n98y6ADzoTOanUYjBJP1wzbTp5MNIGom+WAr74KrIHIc+frkatNphKmo
         axdqMBJWNt6NDEytVPOXSveeBCp7a9uyKGsXVn37VUr3B5OotQhs7Ng+W9R3t1mnc+
         7bu2/madj53UDMHI//w25Im7n5NeuSi52UXgUsQZ5ysL51MSFmrd77sYOy4sfaYg+S
         LqOt/+oYh2VEKI1A8k/a+5LKPSMC30CpVkB466ju7xue3fx+VV2PU74Xn5W7TmFabL
         d95RsQ6Dk1k70ytqwJaArAbM0zlUdNOY7ntpkLxx9mhf+l7TDmbb3MGQmsyjMoS2RF
         zn/iq02Ys3kqw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/26/20 7:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/gup.c
> 
> between commit:
> 
>   732b80e677b8 ("mm/gup/writeback: add callbacks for inaccessible pages")
> 
> from the kvms390 tree and commit:
> 
>   9947ea2c1e60 ("mm/gup: track FOLL_PIN pages")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below - maybe not optimally) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Yes. Changes to mm/gup.c really should normally go through linux-mm and 
Andrew's tree, if at all possible. This would have been caught, and figured out
on linux-mm, had that been done--instead of leaving the linux-next maintainer
trying to guess at how to resolve the conflict.

+Cc David Hildenbrand, who I see looked at the kvms390 proposed patch a bit.
Maybe he has some opinions, especially about my questions below.

The fix-up below may (or may not) need some changes:


diff --cc mm/gup.c
index 354bcfbd844b,f589299b0d4a..000000000000
--- a/mm/gup.c
+++ b/mm/gup.c
@@@ -269,18 -470,11 +468,19 @@@ retry
  		goto retry;
  	}
  
+ 	/* try_grab_page() does nothing unless FOLL_GET or FOLL_PIN is set. */
+ 	if (unlikely(!try_grab_page(page, flags))) {
+ 		page = ERR_PTR(-ENOMEM);
+ 		goto out;
+ 	}
 +	if (flags & FOLL_GET) {


If I'm reading the diff correctly, I believe that line should *maybe* be changed to:

	if (flags & (FOLL_GET | FOLL_PIN)) {

...because each of those flags has a similar effect: pinned pages for DMA or RDMA
use. So either flag will require a call to arch_make_page_accessible()...except that
I'm not sure that's what you want. Would the absence of a call to 
arch_make_page_accessible() cause things like pin_user_pages() to not work correctly?
Seems like it would, to me.

(I'm pretty unhappy that we have to ask this at the linux-next level.)

Also below...


- 		if (unlikely(!try_get_page(page))) {
- 			page = ERR_PTR(-ENOMEM);
- 			goto out;
- 		}
 +		ret = arch_make_page_accessible(page);
 +		if (ret) {
 +			put_page(page);


put_page() only works with FOLL_GET. So if we do allow to get here via either FOLL_GET or
FOLL_PIN, the we need to do an unpin_user_page(), like this:

		if (flags & FOLL_PIN)
			unpin_user_page(page);
		else
			put_page(page);



 +			page = ERR_PTR(ret);
 +			goto out;
 +		}
 +	}
  	if (flags & FOLL_TOUCH) {
  		if ((flags & FOLL_WRITE) &&
  		    !pte_dirty(pte) && !PageDirty(page))

thanks,
-- 
John Hubbard
NVIDIA
