Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D3113435A
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 14:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbgAHNGC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 08:06:02 -0500
Received: from mga12.intel.com ([192.55.52.136]:28589 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbgAHNGC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 08:06:02 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 05:06:01 -0800
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="254217489"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.200.155]) ([10.254.200.155])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 08 Jan 2020 05:06:00 -0800
Subject: Re: linux-next: Fixes tag needs some work in the rdma tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
        Kaike Wan <kaike.wan@intel.com>
References: <20200108073349.2b270de3@canb.auug.org.au>
From:   Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <67b5c37f-ff63-9ae5-fe80-0d2ac0821000@intel.com>
Date:   Wed, 8 Jan 2020 08:05:58 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200108073349.2b270de3@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/7/2020 3:33 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    44ec5aa3c615 ("IB/hfi1: List all receive contexts from debugfs")
> 
> Fixes tag
> 
>    Fixes: bf808b5039c ("IB/hfi1: Add kernel receive context info to debugfs")
> 
> has these problem(s):
> 
>    - SHA1 should be at least 12 digits long
>      Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>      or later) just making sure it is not set (or set to "auto").
> 

bf808b5039c

should be:

bf808b5039c6

A character got left off by mistake. Jason do you want to just fix this 
in your tree directly? Do we let it go and just make sure to catch it 
next time? Let me know if you want a new patch or something.

-Denny
