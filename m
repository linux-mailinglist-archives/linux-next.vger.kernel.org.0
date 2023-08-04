Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDD2770A6B
	for <lists+linux-next@lfdr.de>; Fri,  4 Aug 2023 23:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjHDVGU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Aug 2023 17:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjHDVFu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Aug 2023 17:05:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E734C37
        for <linux-next@vger.kernel.org>; Fri,  4 Aug 2023 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691183137; x=1722719137;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GdSn30EWj8PAnzpsDEQ6DMDcJb97ZpJNs/n0eGRFKss=;
  b=mxmNjt9sl7XfQ3zGI8xcVKkmfQ7A4Wb8Ft/EkLI57eXRSKeZCEi7ufCj
   JTcaxSJ3wuUZE+1Sub8VF0up5msQocWr6KmncWa9HxNollac2n2cmhIFR
   N2bzTwHkSwe9Y1RlRCMgFbZQDtG+fa6LUZyb23LrzHMKh/5mSl+3BQvyX
   H458+ZhfSnAuVrt+rbqWEsDwoJxFUAadn0rVVOzffRt36yd0C6NQE6Xfp
   U/4Q8wLgsBHES+rZ1R/P7RgpFukM2ZlIWYBCWGZvcf4np+aHi4qplWTiq
   +Vd425LTraS6otRcVxrMwtnxbBBQPTkoGc3tQPXE8jKXUnOJoVlirse2/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401204368"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="401204368"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 14:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="730200539"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="730200539"
Received: from lnstern-mobl1.amr.corp.intel.com (HELO [10.209.39.254]) ([10.209.39.254])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 14:05:36 -0700
Message-ID: <1fb3356b-7c68-b7fb-3ec8-4f26306b3e00@intel.com>
Date:   Fri, 4 Aug 2023 14:05:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Shadow stack branch for linux-next
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
References: <5339bb88079f75a1e725ece7fc562938ba193169.camel@intel.com>
 <15e8f5d0-4c64-475c-b095-5883d5af89b7@sirena.org.uk>
From:   Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <15e8f5d0-4c64-475c-b095-5883d5af89b7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/4/23 13:07, Mark Brown wrote:
>> The series hasn't changed much since the 6.4 based branch except a
>> rebase and a few small patches on top. AFAIK, there is nothing gating
>> submission for 6.6, so it would be nice to get it some linux-next
>> exposure. Please let me know if I can do anything to facilitate this.
> I think previously it was picked up in -next by virtue of being included
> via the x86 part of the tip tree (which does make sense for an x86
> architecture feature) - not sure how x86 and general tip processes
> usually work here though.

I just updated it yesterday so it might take a day or two to get merged
into tip/master.
