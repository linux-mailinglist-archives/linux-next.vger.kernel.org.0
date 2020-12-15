Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BF72DA843
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 07:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgLOGyZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 01:54:25 -0500
Received: from mga17.intel.com ([192.55.52.151]:40670 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbgLOGyR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Dec 2020 01:54:17 -0500
IronPort-SDR: 2bCu3hAv+j7hILm0xIhVvhdbCVb0dWO5NmCgSuhxCbtcgLh5ERA3IYxnBggHUaXQDQfREulkOP
 TE2lb92BEKYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="154642651"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="154642651"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 22:52:29 -0800
IronPort-SDR: DE3cRZarcBnrVaU/AKPXhKXcY+Ctq7wVAvSofUPZdecREi9WqSYdtfBGjRUZK8U0NfFBoyMNo8
 7Xmc6NHbtaGA==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="332314752"
Received: from tnaseer-mobl.amr.corp.intel.com (HELO skuppusw-mobl5.amr.corp.intel.com) ([10.209.51.80])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 22:52:29 -0800
Subject: Re: linux-next: manual merge of the amdgpu tree with the pci tree
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Alex Deucher <alexdeucher@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jay Vosburgh <jay.vosburgh@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean V Kelley <sean.v.kelley@intel.com>
References: <20201214233757.GA276422@bjorn-Precision-5520>
From:   "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <bebf5028-9a3e-59fe-ea70-c5e5e61fcb72@linux.intel.com>
Date:   Mon, 14 Dec 2020 22:52:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214233757.GA276422@bjorn-Precision-5520>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 12/14/20 3:37 PM, Bjorn Helgaas wrote:
> On Mon, Dec 14, 2020 at 06:18:54PM -0500, Alex Deucher wrote:
>> On Mon, Dec 14, 2020 at 6:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>>> On Tue, Dec 15, 2020 at 07:34:31AM +1100, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> On Tue, 8 Dec 2020 13:56:20 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>>

>>
>> I don't plan to merge this upstream via my tree.  I was just carrying
>> it in my drm-next branch because we have a number of users that depend
>> on it for working DPC and a number of people use this branch for
>> testing.
> 
> OK, thanks.  FWIW, it's currently marked "Changes Requested" in
> patchwork, so it isn't really going anywhere right now:
> 
> https://patchwork.kernel.org/project/linux-pci/patch/cbba08a5e9ca62778c8937f44eda2192a2045da7.1595617529.git.sathyanarayanan.kuppuswamy@linux.intel.com/
There is a newer version of this patch set. Please use it when merging this patch.
https://patchwork.kernel.org/project/linux-pci/list/?series=370855
> 
> I have merged Sean's series, so this would be a good time to try to
> move this one forward.
> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
