Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C76A785A37
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 08:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfHHGDa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 02:03:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:59393 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726106AbfHHGDa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Aug 2019 02:03:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 23:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; 
   d="gz'50?scan'50,208,50";a="193082697"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2019 23:03:26 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hvbWH-0005JK-Fl; Thu, 08 Aug 2019 14:03:25 +0800
Date:   Thu, 8 Aug 2019 14:02:59 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Steffen Maier <maier@linux.ibm.com>
Cc:     kbuild-all@01.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Ming Lei <ming.lei@redhat.com>, linux-next@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
        dm-devel@redhat.com, linux-s390@vger.kernel.org,
        Benjamin Block <bblock@linux.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Steffen Maier <maier@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@kernel.dk>,
        "Ewan D . Milne" <emilne@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Mike Snitzer <snitzer@redhat.com>
Subject: Re: [PATCH 2/2] scsi: core: fix dh and multipathing for SCSI hosts
 without request batching
Message-ID: <201908081445.oJLHRUt7%lkp@intel.com>
References: <20190807144948.28265-3-maier@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2fo2aexgoo67bv6u"
Content-Disposition: inline
In-Reply-To: <20190807144948.28265-3-maier@linux.ibm.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--2fo2aexgoo67bv6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steffen,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[cannot apply to v5.3-rc3 next-20190807]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Steffen-Maier/scsi-core-fix-missing-cleanup_rq-for-SCSI-hosts-without-request-batching/20190808-052017
config: riscv-defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.4.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.4.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/scsi/scsi_lib.c:1824:3: error: 'const struct blk_mq_ops' has no member named 'cleanup_rq'; did you mean 'queue_rq'?
     .cleanup_rq = scsi_cleanup_rq,
      ^~~~~~~~~~
      queue_rq
   drivers/scsi/scsi_lib.c:1824:16: error: 'scsi_cleanup_rq' undeclared here (not in a function); did you mean 'scsi_queue_rq'?
     .cleanup_rq = scsi_cleanup_rq,
                   ^~~~~~~~~~~~~~~
                   scsi_queue_rq
   drivers/scsi/scsi_lib.c: In function 'scsi_device_from_queue':
>> drivers/scsi/scsi_lib.c:1881:20: error: 'scsi_mq_ops_no_commit' undeclared (first use in this function); did you mean 'scsi_mq_ops'?
     if (q->mq_ops == &scsi_mq_ops_no_commit ||
                       ^~~~~~~~~~~~~~~~~~~~~
                       scsi_mq_ops
   drivers/scsi/scsi_lib.c:1881:20: note: each undeclared identifier is reported only once for each function it appears in

vim +1881 drivers/scsi/scsi_lib.c

  1811	
  1812	static const struct blk_mq_ops scsi_mq_ops = {
  1813		.get_budget	= scsi_mq_get_budget,
  1814		.put_budget	= scsi_mq_put_budget,
  1815		.queue_rq	= scsi_queue_rq,
  1816		.complete	= scsi_softirq_done,
  1817		.timeout	= scsi_timeout,
  1818	#ifdef CONFIG_BLK_DEBUG_FS
  1819		.show_rq	= scsi_show_rq,
  1820	#endif
  1821		.init_request	= scsi_mq_init_request,
  1822		.exit_request	= scsi_mq_exit_request,
  1823		.initialize_rq_fn = scsi_initialize_rq,
> 1824		.cleanup_rq	= scsi_cleanup_rq,
  1825		.busy		= scsi_mq_lld_busy,
  1826		.map_queues	= scsi_map_queues,
  1827	};
  1828	
  1829	struct request_queue *scsi_mq_alloc_queue(struct scsi_device *sdev)
  1830	{
  1831		sdev->request_queue = blk_mq_init_queue(&sdev->host->tag_set);
  1832		if (IS_ERR(sdev->request_queue))
  1833			return NULL;
  1834	
  1835		sdev->request_queue->queuedata = sdev;
  1836		__scsi_init_queue(sdev->host, sdev->request_queue);
  1837		blk_queue_flag_set(QUEUE_FLAG_SCSI_PASSTHROUGH, sdev->request_queue);
  1838		return sdev->request_queue;
  1839	}
  1840	
  1841	int scsi_mq_setup_tags(struct Scsi_Host *shost)
  1842	{
  1843		unsigned int cmd_size, sgl_size;
  1844	
  1845		sgl_size = scsi_mq_inline_sgl_size(shost);
  1846		cmd_size = sizeof(struct scsi_cmnd) + shost->hostt->cmd_size + sgl_size;
  1847		if (scsi_host_get_prot(shost))
  1848			cmd_size += sizeof(struct scsi_data_buffer) +
  1849				sizeof(struct scatterlist) * SCSI_INLINE_PROT_SG_CNT;
  1850	
  1851		memset(&shost->tag_set, 0, sizeof(shost->tag_set));
  1852		shost->tag_set.ops = &scsi_mq_ops;
  1853		shost->tag_set.nr_hw_queues = shost->nr_hw_queues ? : 1;
  1854		shost->tag_set.queue_depth = shost->can_queue;
  1855		shost->tag_set.cmd_size = cmd_size;
  1856		shost->tag_set.numa_node = NUMA_NO_NODE;
  1857		shost->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
  1858		shost->tag_set.flags |=
  1859			BLK_ALLOC_POLICY_TO_MQ_FLAG(shost->hostt->tag_alloc_policy);
  1860		shost->tag_set.driver_data = shost;
  1861	
  1862		return blk_mq_alloc_tag_set(&shost->tag_set);
  1863	}
  1864	
  1865	void scsi_mq_destroy_tags(struct Scsi_Host *shost)
  1866	{
  1867		blk_mq_free_tag_set(&shost->tag_set);
  1868	}
  1869	
  1870	/**
  1871	 * scsi_device_from_queue - return sdev associated with a request_queue
  1872	 * @q: The request queue to return the sdev from
  1873	 *
  1874	 * Return the sdev associated with a request queue or NULL if the
  1875	 * request_queue does not reference a SCSI device.
  1876	 */
  1877	struct scsi_device *scsi_device_from_queue(struct request_queue *q)
  1878	{
  1879		struct scsi_device *sdev = NULL;
  1880	
> 1881		if (q->mq_ops == &scsi_mq_ops_no_commit ||
  1882		    q->mq_ops == &scsi_mq_ops)
  1883			sdev = q->queuedata;
  1884		if (!sdev || !get_device(&sdev->sdev_gendev))
  1885			sdev = NULL;
  1886	
  1887		return sdev;
  1888	}
  1889	EXPORT_SYMBOL_GPL(scsi_device_from_queue);
  1890	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--2fo2aexgoo67bv6u
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--2fo2aexgoo67bv6u--
