Return-Path: <linux-next+bounces-2631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 230BE912D2E
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 20:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A34671F25634
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 18:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D348548F7;
	Fri, 21 Jun 2024 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sg3QDiYb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z1lUoq39"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB28820;
	Fri, 21 Jun 2024 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718994641; cv=fail; b=nu8ClP0s2yG+7RR8ykUGhbwaojRFH8S3WUjP3w39Q54z6FdnLQEmtTbUKzb5f8+uVkYl9mB9L8w0Ycq4SrkTVUB2C+6i9FkWBDkFrEzmRjhlzopFwv/m9v9YQJ+uiv6k5jEBvvzV1Uy22WUvIHhQGde7UttfpbbVRxy47rSmI5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718994641; c=relaxed/simple;
	bh=nfnj0Ta+kpKT6ccGsPbOa06nUMV6Pyg3zn0ILjD4Qtg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=llItmzAM9yV0QXfk1v0RBv7UbJL7/6KUL5sV0f5PwI/r4oxdayLMNioLlZGx+ps2LkNk61nFrQfKGeKxF57It9oMkT7ZKNr7RFLsVT6IqjLyxD0ihSQpzFl4sfCZjvrrFxfFRHPiC+eL6RgmGFMk7R17nj+Jss2lTt4zuvwzUU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sg3QDiYb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z1lUoq39; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LEXc5L010418;
	Fri, 21 Jun 2024 18:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=0BrV88uW7eqZCO
	pEXeZ5ClWyPrYLQfu2H+y/WKxqeS4=; b=Sg3QDiYb1mj9iexjDC26HWqXis9gqT
	VN8HM0eV+9+G5q2qewnotIoXoqBiYVPheodBo3SKuUVeVBI7r5drUdnnY2cqLJQU
	8YobcDPr6Of9eRYeS3Cr0XehFZ/xaWbtaPxi4vt8KVeuN/+qliLmud/UrTHnOCqn
	fel0K2HOCOyW50sFIoOC8IqaXIlFgWFzPXj29m5jKvXCySRTq9D1FJ4fDldFaxkB
	FTHQxjV2hJMviHOv2JH/z9+E/B9cKl/orkWjOswTI0OrZ3HSu/WhowND+6+N07rk
	zDuJta2iex1uyxdZgAxNKFc7suc0G9ulmRhV5jACZmpQqBubIqPmjYcw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrkttby0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 18:30:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45LH8Z64019383;
	Fri, 21 Jun 2024 18:30:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn468mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2024 18:30:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlCcoLNnB45Xr+6AuBUcROpydRXbA/b4R6qrMMcB9qK9aeOApD0w1sllX380E4++ZlEEQHoRubcZIG56b04pnxlqMCx1OvA4v4v3lKqTG44OKK85OB1qoJ/AB8x2GqVyb1sztwzjpAyb/U5Fvzd+AX2PB5CQHtIXL7zYIsrQoYDdEzj7kg93RSM+tvXd1hxpf+QfRFSOIPVPzBs1YiF/zFf5bBkiDYYuahj/G3d30bAqzDslNTw8ZQqk9Wlofqq9AJkmmTteleEJmCNkgHz7XwXb7ncEPaA6AgxIrVj9JAs6Es/PxEoJ44XLwdZ7Pe4sC3qqH4FFEpUCcC1bbyNKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BrV88uW7eqZCOpEXeZ5ClWyPrYLQfu2H+y/WKxqeS4=;
 b=Ymx/Wr8Q17kJHz2Yr49auOnShrD/BU/Dw4l1dgIolH8KoaTXYOsXasc1MMidZBVZcUQVoHJrcQAOQv2uqeDfNkgAU1/pZV5sQ6/FJSqfe2HRAGJJMidZgKFS+rf4AlL/dtfrJWYr+SyCAwQDhA6o4ffNARvcaFU0l5owrCQZrnqGb8xO7nw5LkDHzlnaHeG66/AgrOGBUmqar2O5jax/03c84ojZw/yVTqmDCdGJ1H9N+ycVFMuXl8xJ9LZkAYJdUf7lxFYPkZ8rfenFvl4gdSqusA13TPiLgim/ELAyQOg1AwHycgcj6jcH8511eTjNpUs+/CpqJXWnjbPurSmlnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BrV88uW7eqZCOpEXeZ5ClWyPrYLQfu2H+y/WKxqeS4=;
 b=Z1lUoq39Bg+jVczuZLD3heEvAze0U2xK2RPPh4VBVBMOvLJl9ilL8FPT/bpJIuaF6XWQtMGV8NQc22wCn6HmZkkCFHoLo8pBg6n/OVUUQ2UuSd8Y5oE10YoSgQcbxQIPTI/rGDLdtaCwOeDuKwZanbSuhntYWxuAzJW7Ql9g6Uk=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by IA1PR10MB6170.namprd10.prod.outlook.com (2603:10b6:208:3a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Fri, 21 Jun
 2024 18:30:32 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%6]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 18:30:32 +0000
From: John Garry <john.g.garry@oracle.com>
To: axboe@kernel.dk
Cc: linux-block@vger.kernel.org, linux-next@vger.kernel.org,
        broonie@kernel.org, John Garry <john.g.garry@oracle.com>
Subject: [PATCH] block: Fix blk_validate_atomic_write_limits() build for arm32
Date: Fri, 21 Jun 2024 18:30:16 +0000
Message-Id: <20240621183016.3092518-1-john.g.garry@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|IA1PR10MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 5918c479-5e8b-49cf-c737-08dc92203c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xvaMZq+WcJZPN15SHb5ZlYWwB1KaVo4IE2Enre8/mlEC5g4YlcgJvWgT+Prv?=
 =?us-ascii?Q?EnTxSoCf5e7xO/eopEjiq4BNPWoxWht4zrKR9oWGXdQNAmcSsapJCpRCu8Bj?=
 =?us-ascii?Q?ry6/91ZRymQBDhMZol1NKPfG8r5mzRcaqNHFF5GDKb3XjvjybCqKKjEiwtpg?=
 =?us-ascii?Q?8IBJs1XfIS8v+CMGa3JNU4vxz0VrcufDQRKmfmK2tHricNO5fIrDBfjqG2Hd?=
 =?us-ascii?Q?6jx80bPA0SPSPuKc+Jm9rucbJ+z5dZ5l/eyDY1HZw36sKz2x3QT83Kws/wOV?=
 =?us-ascii?Q?tgJU8bXTsxhsa5F5kfNzys+A2NuCebIdDQ2O3NtuQeZ79Z4sam4ZeNPzw4NS?=
 =?us-ascii?Q?4CUdfvdApEA1rl4LrNxkav9EAHvPcd3G4rn6dAT+VotD8UJ55ZxdJ33+iiQ0?=
 =?us-ascii?Q?l4DjudCZf5d+qkIn/y/Cl3K85Ei/Q/7BPqgZKlRZ869IooJUln5+6xzgTPvR?=
 =?us-ascii?Q?NxisN3NjZtaRUwIYNmnESHtdX2oqsSQuKsLPsHZQS7ye2ioMUreqcuEE7tml?=
 =?us-ascii?Q?CbV0JnPVtiMEnKP+2NYj8o7fgAGSqFui3Yjn/pqs/kF72cQLpZPeN5n0ID11?=
 =?us-ascii?Q?5k1cYaciQzN5/6qY3WBFrVzP368uuux4vymhAyUZkxkLU+VXWTOzI2N1nPlz?=
 =?us-ascii?Q?eYAOhyK3LTnMkf7pRupRv1ScBJ8q93fgPx4syL7nmymSU4pxCNaL7wOG2UjC?=
 =?us-ascii?Q?al15NoO607IQ604YM7bSt4AJoAzBzBnQrXLb1ZQvGBuG1LL2PT52hO6FT3g+?=
 =?us-ascii?Q?dqOHGsMwAOowkJmvuTJBsZOLoJc+tUwXlC00dCVoZySGnyhma15ySl/QbN4k?=
 =?us-ascii?Q?RcxlCBdoPOfSt8KFXf5C4Gg6XiAgKqxTWm2V+cyaNT7RSRPB3Egc92gnbgHG?=
 =?us-ascii?Q?HSZhjSPC240yz1BESfIMZKlETLdv3eLIgI4g/VX0S7IsefMav08b8gnuOZ8D?=
 =?us-ascii?Q?J/HZYlh+rVygt6/CnYlRJcx/HuZO+sqFZG9tqA850rcmmAr2U/xmQXmze3za?=
 =?us-ascii?Q?RWDypVZMFon3he2d0kNcd+KX9zv7829ngoUmPq82NXUfTn6qrRIbT50cTfWD?=
 =?us-ascii?Q?8wMk4fPxdvZxHKj2CLhzjGrqOG29xrsOt/sJwvW5bkgeh4fDkt7OB3frwjT/?=
 =?us-ascii?Q?wJhm8r3+C6aEEHLCQiA6apW1o1ThfUKT3f7qQERiXJqDBDhgSsqNNv26ocsK?=
 =?us-ascii?Q?YRmyZmCkMXRZ/k/4WjDadz54r5dAu7Fl7T4e1cryZAAuj1s1A2owXIy9djdY?=
 =?us-ascii?Q?Jnr/k1keceqXBkNZQrij?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YqMsyWuf600RxLvePviuZXZdKHcCunHhKyikB/YNxUtAt/vp4rYGqRN//hM2?=
 =?us-ascii?Q?dkKEadjFNT7FuKxR5y4GJj3+5HMFFgZR+Hn2DSCMhl/i6oTfYwNtZMBfbils?=
 =?us-ascii?Q?5gMQOzmzTX/pX/tf/lRcMWJjG79h7fyIRLXtuVWTXVSgO5TrFKpLFDWYvAvX?=
 =?us-ascii?Q?QnxTnApVwJpuh8SDsyh6/zgLdr78b/0N26KphuiJs8P+ZZyLMy2r0GWe96XG?=
 =?us-ascii?Q?G2RiyLSGfqncpC+FPuXBoFP3BgdoRJWmRR5R3A/P1QevgnW8wmtBlF5+eA+k?=
 =?us-ascii?Q?MGwSRqvunFOPX22RGetUT3E0u2+eyZL1ITq8KzvnhyDHFHS/QUr4vNPqNcug?=
 =?us-ascii?Q?UbaHj4Gf/q8g+b6LJUWgbILwB6s48XO0LQF/6x+3jM+OBfdfCL6fw+0+fN0Q?=
 =?us-ascii?Q?rgHLbJGoVhUzswQSEWb5kl2m2iRJvPUi6xaVSjc50S5LjFNSXPXVrdyFyO1/?=
 =?us-ascii?Q?5XBHeBdDefMLQZU1RdKf9vSTa5kEML8vHyPfV69stgWzUGy1bgJAvDYAyhhm?=
 =?us-ascii?Q?cJfmH4PdF5u4e1ttHgworHSEW5sThfioKgduqtQcDENi4dUaxCYJhk8Ie5Tp?=
 =?us-ascii?Q?1+qTJAYiyMcxhomimApWVAvfAAIvTW/j46mlU3+At9WuP2Iu4GFxQ9xDsjRb?=
 =?us-ascii?Q?6yH5tgOnUq8dKQwwmpHLs7i7ljtlPtPdb4DqC15w5KoAFSPe37WcHNG369Sa?=
 =?us-ascii?Q?roiPc7WvYKCGQZZrgpkzfrQ8Nki+09+GLtCvF4g5ZzG8xHpVB9K8RfIkQkl0?=
 =?us-ascii?Q?ul6u0ABNAFjXJDViC1DfAO4yAM8SGWW4Ef1LtTW/uL08Eyn70vxLECbRWNUi?=
 =?us-ascii?Q?Y5cFGNqwJm1qXgHZ0E4MUSXpM7A7L3yxbFdbcvZqqxEO5/wLM5GbVUHkJKoz?=
 =?us-ascii?Q?HIHM8vTNh8wftKFiDwneL5Nydkq52mIqR6eXLwIwx2dH6MtF2pfmj3LUxu9h?=
 =?us-ascii?Q?bauIsfraKENIM0M0RjeDVmPQc/2dwF7kPKoha/VAz1gPCM6XUugBcAqp4Kjs?=
 =?us-ascii?Q?7lNPCWWbhVzcYlJgbMVwVFL31bN+qKGe/Ck0tDD+jPNRqyVYbWzrVNCJ0psS?=
 =?us-ascii?Q?uMuPT2qckU2gCvuTdramT7/9+muaWAdtpUkpyoAAQsuGFsMlkBYUhks5ccEG?=
 =?us-ascii?Q?iPz11fiAYjlYplYwiKjcPfnzTCmvm4RYL0ex+WUmPZ0+UUkls7iXVpVJdNrW?=
 =?us-ascii?Q?EXzLb/LsPvg2d2AmyTm7Xe70xPvHm1CMWe4AbaAYEcEMEYqTgSzBwuaKinle?=
 =?us-ascii?Q?LFjjKEtEENV9eJfaSpn1zs37md/FGmDuYsCGfohNLMJ2RPoTcCXTNXJeddnV?=
 =?us-ascii?Q?Xnyl/lvt3mcbN7QCq6uIClRL/dhY8ASXlYDQ5pQvJRvrXSWdLMNSSESVPP0F?=
 =?us-ascii?Q?IcsQJxUCg1VOS6WgQaNJiIPPcYFVSAnqi4Wo4UK0OVI5f+RfvcB61+OVwHJY?=
 =?us-ascii?Q?zNn9VoV5RAkdHC2D2aG/dCOwotNx4ZAAqbgkfl1jt64Ym7nwCgXqc7NG1QKw?=
 =?us-ascii?Q?W1VA93FhhR9T12AOSOfoUXNEzVzPMoznXOoyc5Nf1pq1zyljBJIK3IcHGJDG?=
 =?us-ascii?Q?D4MBjEYV+BF/smw1pYLUdwnBf9CgrhVTNpgADfuIyO1qCJPuzDg/xXTWnvqI?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mt2l4zQd2TXJWb0qcjp17UxqoYzSNcFDBoTfOL+SjMBMCLWyCCXDL3XJCnWOW4sfD+WHXPG55QAg2r9ZiupzifH9BKAsV+EgEIedvjDOsdupsNNSLNcrZoDd9Dso1Ckk68po4qcEfdueOzn/iSlTmLBIF0dqLXwvgjl/d0+uWkmuIlVnrtgq77P4pPJQhd8tQIL1ulFtiAclxMv/uX/3JKbNE69x/9FEsF/wVorrSn1m69+VheZ7AOlgkiAFkhhkhkPudqM4Nst2mSGbKZQP+6Q4xqXUhQOxURmf2gOQePNmwKX1+YJWGu2BqtAk+JBN/nAbSl9flC0W8AjBA3YBbmnQiPCsQCNCn/yrjC7x8zeq2QTmFBSK/ZauAhKnp5Seh3Nx0E1eG/xt9Tvd+uX1xVsU4fqMJL1rzSu2wPLhHtMVq2UaAyu/uEJ1XD+rgFkfzNrcX0fevPN4wARfTdB+o3CMCX6YkTs0oqvXHBZzB2VtMkMBOpwFytAmsbmbJVt2MsklkflorvYEuwa/aP4N7VD5SUb+AZ0/PhuWxxedMqeO/qgSlm7NSBpaStJ9/q0fWoSRFIbeuCPWS/L9bx04OzJJcufgBnTEEuNfI7xnwcs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5918c479-5e8b-49cf-c737-08dc92203c1f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 18:30:32.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5Z/EYQW4GI8DxMOikpjScJuWu2k+SHfXEqzrH9JQn+saYpsln5l/ua8cI+0rPncnGu36yV4gkZTyEGB5BlthA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_10,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=925 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406210134
X-Proofpoint-GUID: doMUKC0gdzFq_aBkuZwaNqfrszXonlyZ
X-Proofpoint-ORIG-GUID: doMUKC0gdzFq_aBkuZwaNqfrszXonlyZ

For arm32, we get the following build warning:
 In file included from /tmp/next/build/include/linux/printk.h:10,
                  from /tmp/next/build/include/linux/kernel.h:31,
                  from /tmp/next/build/block/blk-settings.c:5:
 /tmp/next/build/block/blk-settings.c: In function 'blk_validate_atomic_write_limits':
 /tmp/next/build/include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
   222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
       |                                   ^~

The divident for do_div() should be 64b, which it is not. Since we want to
check 2x unsigned ints, just use % operator. This allows us to drop the
chunk_sectors variable.

Fixes: 9da3d1e912f3 ("block: Add core atomic write support")
Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/linux-next/b765d200-4e0f-48b1-a962-7dfa1c4aef9c@kernel.dk/T/#mbf067b1edd89c7f9d7dac6e258c516199953a108
Signed-off-by: John Garry <john.g.garry@oracle.com>

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 37fe4c8f6b6b..ec7dbe93d5c3 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -175,7 +175,6 @@ static void blk_atomic_writes_update_limits(struct queue_limits *lim)
 
 static void blk_validate_atomic_write_limits(struct queue_limits *lim)
 {
-	unsigned int chunk_sectors = lim->chunk_sectors;
 	unsigned int boundary_sectors;
 
 	if (!lim->atomic_write_hw_max)
@@ -197,7 +196,7 @@ static void blk_validate_atomic_write_limits(struct queue_limits *lim)
 		 * Devices which do not conform to these rules can be dealt
 		 * with if and when they show up.
 		 */
-		if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
+		if (WARN_ON_ONCE(lim->chunk_sectors % boundary_sectors))
 			goto unsupported;
 
 		/*
-- 
2.31.1


