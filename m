Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7EFB4072
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 20:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbfIPSjm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 14:39:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:43418 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727505AbfIPSjm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Sep 2019 14:39:42 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Sep 2019 11:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; 
   d="scan'208";a="177133449"
Received: from mnichels-mobl.amr.corp.intel.com (HELO localhost) ([10.252.53.200])
  by orsmga007.jf.intel.com with ESMTP; 16 Sep 2019 11:39:39 -0700
Date:   Mon, 16 Sep 2019 21:39:38 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>,
        Shuah Khan <shuah@kernel.org>, Petr Vorel <pvorel@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kselftest tree with the tpmdd
 tree
Message-ID: <20190916183938.GD16093@linux.intel.com>
References: <20190916014535.GU4352@sirena.co.uk>
 <CADYN=9JntrniMnmEMd9igVSovEQjLV9q006cCATLHWrtBhWWHQ@mail.gmail.com>
 <20190916134203.GG4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916134203.GG4352@sirena.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 16, 2019 at 02:42:03PM +0100, Mark Brown wrote:
> On Mon, Sep 16, 2019 at 03:16:54PM +0200, Anders Roxell wrote:
> 
> > If I re-read the Documentation/dev-tools/kselftest.rst
> > I think the patch from the kselftest tree should be dropped.
> 
> > I saw that I didn't send an email to the tpm maintainers or the tpm
> > list when I sent the
> > patch, I'm sorry.
> 
> If the change is fine that might be more trouble than it's worth, it's a
> trivial add/add conflict.  Up to those concerned though.

Do you want me to take the patch off from the next and rebase my
tree later on or?

/Jarkko
