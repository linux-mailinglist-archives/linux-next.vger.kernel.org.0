Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB763193EC
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 21:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbhBKUGF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 15:06:05 -0500
Received: from mx2.suse.de ([195.135.220.15]:39472 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhBKUDz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 15:03:55 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613073782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t8MNYUt693OgN/OKG1EO7Dic8sXK7BRvmpxM1os2oHY=;
        b=UD7HS5URjvM8KwekudT1fJnTyyQV53F6GxyGqPHNW7WBVB/9EAoRDv5IKffIkRYnrzyOQG
        R7I3dzOwZoYCHfVrw6CWhsMOU+lAi+wanhsd6navMSkthD23m15koc5pDkQ2lSgnabvHmV
        kNZdbftTCkPwUJ5I8Z0+z9BD6XBtEGI=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C18FAAEDD;
        Thu, 11 Feb 2021 20:03:02 +0000 (UTC)
Message-ID: <1e954ece10a122cf320e481c750bc75475c6c56b.camel@suse.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
From:   Martin Wilck <mwilck@suse.com>
To:     "Pearson, Robert B" <robert.pearson2@hpe.com>,
        Jason Gunthorpe <jgg@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Bob Pearson <rpearsonhpe@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Thu, 11 Feb 2021 21:03:01 +0100
In-Reply-To: <CS1PR8401MB082107284644BFF6894DCF2EBC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
References: <20210210131542.215ea67c@canb.auug.org.au>
         <CS1PR8401MB0821C1E95BE58300FF3B87C8BC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
         <20210210203641.GG4247@nvidia.com>
         <CS1PR8401MB082107284644BFF6894DCF2EBC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2021-02-10 at 22:08 +0000, Pearson, Robert B wrote:
> Looks perfect. Thanks.

+1

Thanks everyone.


