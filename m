Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C7E12881F
	for <lists+linux-next@lfdr.de>; Sat, 21 Dec 2019 09:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfLUI2B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 21 Dec 2019 03:28:01 -0500
Received: from verein.lst.de ([213.95.11.211]:50389 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbfLUI2A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 21 Dec 2019 03:28:00 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4DDB768B20; Sat, 21 Dec 2019 09:27:58 +0100 (CET)
Date:   Sat, 21 Dec 2019 09:27:58 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 nvdimm-fixes tree
Message-ID: <20191221082758.GA3413@lst.de>
References: <20191218123205.3fb9c793@canb.auug.org.au> <20191218124950.191d9df4@canb.auug.org.au> <CAPcyv4jDozHaSCw26onPfmT1xefX2S2NB3RGL8pz1UWz=UDWWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4jDozHaSCw26onPfmT1xefX2S2NB3RGL8pz1UWz=UDWWw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On Thu, Dec 19, 2019 at 11:49:03AM -0800, Dan Williams wrote:
> Christoph are you going to submit that for v5.5 or is that v5.6 material?

This is intended for 5.6.  If you send your commit to Linus ASAP I can
still rebase.
