Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A886620F39B
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 13:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732977AbgF3LdG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 07:33:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:30221 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727108AbgF3LdG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Jun 2020 07:33:06 -0400
IronPort-SDR: rdXz7iYOXTsipjXjUnBRIQiqe358SH9/Vh56gJHxPuFuVIO9Uv2+JIXQ15n+o/72QcA9tJPTMh
 iz0oDL3FY/3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="164219008"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="164219008"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 04:33:06 -0700
IronPort-SDR: w7yQ3gWRsctn1BGOyh0j4W/JlmWGa928NJyWb7Ts5tgdrQb5y38KYaaxztAue2pRU14snvT3hK
 itCfvspf1+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; 
   d="scan'208";a="386672327"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 30 Jun 2020 04:33:03 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 30 Jun 2020 14:33:02 +0300
Date:   Tue, 30 Jun 2020 14:33:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Maguire <alan.maguire@oracle.com>
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
Message-ID: <20200630113302.GN5180@lahna.fi.intel.com>
References: <20200630160346.696f6419@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630160346.696f6419@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 30, 2020 at 04:03:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the thunderbolt tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> 
> Caused by commit
> 
>   54509f5005ca ("thunderbolt: Add KUnit tests for path walking")
> 
> interacting with commit
> 
>   d4cdd146d0db ("kunit: generalize kunit_resource API beyond allocated resources")
> 
> from the kunit-next tree.

Thanks for reporting and fixing. The fix looks good to me.
