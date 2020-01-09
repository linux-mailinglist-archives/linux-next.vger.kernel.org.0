Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B36135B3E
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 15:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgAIOWV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jan 2020 09:22:21 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:47798 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbgAIOWV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jan 2020 09:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DxwGKPgO3D2IF3vBmmjgp81bFThWYwYhX5RdXbco5Vo=; b=B/NJisdCPQlvKBnTqKVFtn2Go
        NAg3mAMBmiN3dBFD8HAHKGw5ee+Ur9TD1HKyNvo+32i/1abY6CP2Ru/6fLY3gFHq209m04Xh3cBci
        jr+snZNNUC5MR+kYlsBiz5Ngw+VLANGRmFWYtq3EtsqFn5qW0eDDiEbjs60yj4kJ7m0O4pNs3v7Ie
        utaeWhVrty7kE6rbBn/yUyUiM1VnzaxNYRRGqLkyYvGe7XwQOT2pY6WFGk5flU9TqWIc2d5fFJYe8
        xx/2P49Gsio08YULRWfK+RrcUVEVVrKoECNvRBcvCn6D7J7BS+1nm6Dsf119Q7sqpK77yOFgt9tio
        sKS2iXZew==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ipYhW-0005xu-97; Thu, 09 Jan 2020 14:22:18 +0000
Date:   Thu, 9 Jan 2020 06:22:18 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sachinp <sachinp@linux.vnet.ibm.com>,
        linux-scsi <linux-scsi@vger.kernel.org>, jcmvbkbc@gmail.com,
        linux-next <linux-next@vger.kernel.org>,
        Oliver <oohall@gmail.com>,
        "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>,
        manvanth <manvanth@linux.vnet.ibm.com>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when unloading
 mpt3sas driver
Message-ID: <20200109142218.GA16477@infradead.org>
References: <1578489498.29952.11.camel@abdul>
 <1578560245.30409.0.camel@abdul.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578560245.30409.0.camel@abdul.in.ibm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 09, 2020 at 02:27:25PM +0530, Abdul Haleem wrote:
> + CC Christoph Hellwig

The only thing this commit changed for the dma coherent case (which
ppc64 uses) is that we now look up the page to free by the DMA address
instead of the virtual address passed in.  Which suggests this call
stack passes in a broken dma address.  I suspect we somehow managed
to disable the ppc iommu bypass mode after allocating memory, which
would cause symptoms like this, and thus the commit is just exposing
a pre-existing problem.
