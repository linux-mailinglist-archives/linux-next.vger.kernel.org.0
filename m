Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454982C50B5
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 09:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388905AbgKZIqg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 03:46:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:51918 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388904AbgKZIqg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Nov 2020 03:46:36 -0500
IronPort-SDR: cauIQGInGpHQABqkK03Z2Q4g90qH562VmPCWlhGvCaoeyai5RO5XLeNz1ZR/Ma+H4l82A3EB+c
 IE4XinMMXT5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="236387813"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="236387813"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 00:46:35 -0800
IronPort-SDR: RHeRJHUmEaHn84/lqXnTbI4d2EShJYMMtpYFd4XfPC4AZ2ywbOrby9LLYxD1ffOH30Hyx9rE7M
 Gx1lL4Ht690A==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; 
   d="scan'208";a="547636335"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.208.39]) ([10.254.208.39])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2020 00:46:34 -0800
Cc:     baolu.lu@linux.intel.com,
        Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
References: <20201126174851.200e0e58@canb.auug.org.au>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: linux-next: build warnings after merge of the arm64 tree
Message-ID: <701c6589-b263-98bf-e48f-1eb890ff5856@linux.intel.com>
Date:   Thu, 26 Nov 2020 16:46:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201126174851.200e0e58@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2020/11/26 14:48, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm64 tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quote ends without a blank line; unexpected unindent.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Enumerated list ends without a blank line; unexpected unindent.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Unexpected indentation.
> Documentation/ABI/testing/sysfs-kernel-iommu_groups:38: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Caused by commit
> 
>    63a816749d86 ("iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id>/type" file")
> 

Thanks for letting us know this. I will post a patch to fix it.

Best regards,
baolu
