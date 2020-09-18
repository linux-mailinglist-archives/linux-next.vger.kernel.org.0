Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D33226F91E
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 11:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIRJXI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 05:23:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:45520 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgIRJXI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 05:23:08 -0400
IronPort-SDR: /uHpSqLvfV35QtXR+GWnQO0/EW1ymCh7B3nZzNewFCpfyWoLcDvr5wfeIRxGfqcbxmfA1QOGTQ
 xC0W1MBX96yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147578314"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="147578314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 02:23:04 -0700
IronPort-SDR: ClZEEOQe588a+qudcIsxm6VhYj0I3O+/4nudjp/RjQPeWQKyW8dcV5sPcfPxit7B0PRr8q2i02
 FSiMjFRPpJiA==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="484130244"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 02:23:02 -0700
Date:   Fri, 18 Sep 2020 12:21:20 +0300 (EEST)
From:   Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Iulian Olaru <iulianolaru249@yahoo.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
In-Reply-To: <20200918132118.1e753aeb@canb.auug.org.au>
Message-ID: <alpine.DEB.2.22.394.2009181218190.3186@eliteleevi.tm.intel.com>
References: <20200918132118.1e753aeb@canb.auug.org.au>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

+Daniel,+Pierre

On Fri, 18 Sep 2020, Stephen Rothwell wrote:

> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> WARNING: modpost: missing MODULE_LICENSE() in sound/soc/sof/imx/imx-common.o

thanks for the report. I made a patch and once I get acks from
stakeholders, will submit to asoc tree:
https://github.com/thesofproject/linux/pull/2450

We'll also follow up how this slipped through our CI.

Br, Kai
