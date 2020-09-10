Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C25B426449E
	for <lists+linux-next@lfdr.de>; Thu, 10 Sep 2020 12:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgIJKvA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Sep 2020 06:51:00 -0400
Received: from mga02.intel.com ([134.134.136.20]:57470 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgIJKtR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Sep 2020 06:49:17 -0400
IronPort-SDR: p2AkMGkK7lb4tMc+mTrUukjggEV2VnvkVlPETInT8Li5IHOwHBUi2OnSX6dd08z1z3Y364nWXV
 kk/rMi5K8LkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="146212598"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="146212598"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 03:49:14 -0700
IronPort-SDR: np3Lz2Hdt8aRmnjvTDOHJHxP4Gyse2oTaxFQvBAKPXAxPxbhbpIR0nycZ2ZApuDyzWewj3OQ1I
 6O+NW+FG8icA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="407725912"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 Sep 2020 03:49:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 10 Sep 2020 13:49:11 +0300
Date:   Thu, 10 Sep 2020 13:49:11 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: linux-next: Tree for Sep 9
 (drivers/usb/typec/mux/intel_pmc_mux.c)
Message-ID: <20200910104911.GA3709033@kuha.fi.intel.com>
References: <20200909202624.2cc6c3d1@canb.auug.org.au>
 <f2de7078-db94-6914-87af-c0a553daa5cc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2de7078-db94-6914-87af-c0a553daa5cc@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 09, 2020 at 09:04:53AM -0700, Randy Dunlap wrote:
> On 9/9/20 3:26 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200908:
> > 
> 
> on x86_64:
> 
>   CC [M]  drivers/usb/typec/mux/intel_pmc_mux.o
> ../drivers/usb/typec/mux/intel_pmc_mux.c: In function ‘update_port_status’:
> ../drivers/usb/typec/mux/intel_pmc_mux.c:151:21: error: implicit declaration of function ‘readl’ [-Werror=implicit-function-declaration]
>   port->iom_status = readl(port->pmc->iom_base + IOM_PORT_STATUS_OFFSET +
>                      ^~~~~
> ../drivers/usb/typec/mux/intel_pmc_mux.c: In function ‘is_memory’:
> ../drivers/usb/typec/mux/intel_pmc_mux.c:524:10: error: implicit declaration of function ‘acpi_dev_resource_memory’; did you mean ‘acpi_os_read_memory’? [-Werror=implicit-function-declaration]
>   return !acpi_dev_resource_memory(res, &r);
>           ^~~~~~~~~~~~~~~~~~~~~~~~
>           acpi_os_read_memory
> ../drivers/usb/typec/mux/intel_pmc_mux.c: In function ‘pmc_usb_probe_iom’:
> ../drivers/usb/typec/mux/intel_pmc_mux.c:539:8: error: implicit declaration of function ‘acpi_dev_get_resources’; did you mean ‘acpi_get_event_resources’? [-Werror=implicit-function-declaration]
>   ret = acpi_dev_get_resources(adev, &resource_list, is_memory, NULL);
>         ^~~~~~~~~~~~~~~~~~~~~~
>         acpi_get_event_resources
>   CC      drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.o
> ../drivers/usb/typec/mux/intel_pmc_mux.c:547:2: error: implicit declaration of function ‘acpi_dev_free_resource_list’; did you mean ‘acpi_get_event_resources’? [-Werror=implicit-function-declaration]
>   acpi_dev_free_resource_list(&resource_list);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>   acpi_get_event_resources
> ../drivers/usb/typec/mux/intel_pmc_mux.c:550:19: error: dereferencing pointer to incomplete type ‘struct acpi_device’
>    put_device(&adev->dev);

It looks like we are missing ACPI dependency in Kconfig and a include.
I'll prepare the fixes.

Thanks Randy,

-- 
heikki
