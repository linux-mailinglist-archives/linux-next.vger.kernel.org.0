Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2189186644
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 09:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbgCPIVn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 04:21:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:38294 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730034AbgCPIVn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 04:21:43 -0400
IronPort-SDR: z89UwK3TC8ejhNIappCF+/V0a+IC0ae6F1+emltIEJGVw8TfxdsX/jqgCpd4q08N5Gq+YCiUY7
 /7+YxyQhdxFw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 01:21:43 -0700
IronPort-SDR: /jz3pzFR88ralGOhiHgtDcnqVIsUJvQ1UVaMlktLkLHHgJQ/i8dE+UW2kS8dJJhoEaFUfZlJt7
 6wh7XWux9E1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,559,1574150400"; 
   d="scan'208";a="244069261"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga003.jf.intel.com with ESMTP; 16 Mar 2020 01:21:41 -0700
Date:   Mon, 16 Mar 2020 10:21:40 +0200 (EET)
From:   Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
In-Reply-To: <20200314215023.36d41bb9@canb.auug.org.au>
Message-ID: <alpine.DEB.2.21.2003160953020.2957@eliteleevi.tm.intel.com>
References: <20200314215023.36d41bb9@canb.auug.org.au>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Sat, 14 Mar 2020, Stephen Rothwell wrote:

> n commit
>   5c82813ce43e ("ASoC: Intel: boards: drop reverse deps for SND_HDA_CODEC_HDMI")
> 
> Fixes tag
>   Fixes: aa2b4a5 ('ASoC: Intel: boards: fix incorrect HDMI Kconfig dependency')[
> 
>  - SHA1 should be at least 12 digits long

ack, thanks, this is a plain oversight -- other fixes tags from same 
author (i.e. me) as well as other use of the tag in the sound-asoc tree 
appear fine. So my bad, sorry!

Br, Kai
