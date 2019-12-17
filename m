Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C28F31232B5
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 17:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfLQQlr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 11:41:47 -0500
Received: from mga17.intel.com ([192.55.52.151]:41853 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727039AbfLQQlq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 11:41:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 08:41:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; 
   d="scan'208";a="240483278"
Received: from krose-mobl.amr.corp.intel.com (HELO [10.254.184.73]) ([10.254.184.73])
  by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2019 08:41:45 -0800
Subject: Re: [alsa-devel] linux-next: Tree for Dec 17
 (sound/soc/intel/boards/cml_rt1011_rt5682.o)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
References: <20191217130829.6a66b404@canb.auug.org.au>
 <c4fd86fb-586a-0fbc-74b0-97e6b99ef2ca@infradead.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <94745c3a-33aa-b307-06d6-ba0c8dddc9d2@linux.intel.com>
Date:   Tue, 17 Dec 2019 10:41:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c4fd86fb-586a-0fbc-74b0-97e6b99ef2ca@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org




> on x86_64:
> 
>    CC      sound/soc/intel/boards/cml_rt1011_rt5682.o
> ../sound/soc/intel/boards/cml_rt1011_rt5682.c:409:4: error: ‘struct snd_soc_codec_conf’ has no member named ‘dev_name’
>     .dev_name = "i2c-10EC1011:00",

ACK, thanks for reporting this conflict with ee8f537fd8b71c ('ASoC: 
soc-core: remove legacy style of codec_conf')

Will send a patch in the next 30mn.


